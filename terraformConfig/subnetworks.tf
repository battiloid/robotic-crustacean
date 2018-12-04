data "aws_availability_zones" "main" {}

##
## Private Subnet
##

resource "aws_subnet" "private" {
  count = "${var.create ? length(var.private_sub_cidr) : 0}"

  vpc_id                  = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}"
  availability_zone       = "${element(data.aws_availability_zones.main.names, count.index)}"
  cidr_block              = "${element(var.private_sub_cidr, count.index)}"
  map_public_ip_on_launch = true

  tags = "${merge(var.tags, map("Name", format("%s-private-%d", var.name, count.index + 1)))}"
}

resource "aws_route_table" "private_subnet" {
  count = "${var.create ? length(var.private_sub_cidr) : 0}"

  vpc_id = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}" # TODO: Workaround for issue #11210

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index)}"
  }

  tags = "${merge(var.tags, map("Name", format("%s-private-%d", var.name, count.index + 1)))}"
}

resource "aws_route_table_association" "private" {
  count = "${var.create ? length(var.private_sub_cidr) : 0}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_subnet.*.id, count.index)}"
}

##
## Public Subnet
##

resource "aws_subnet" "public" {
  count = "${var.create ? length(var.public_sub_cidr) : 0}"

  vpc_id                  = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}"
  availability_zone       = "${element(data.aws_availability_zones.main.names, count.index)}"
  cidr_block              = "${element(var.public_sub_cidr, count.index)}"
  map_public_ip_on_launch = true

  tags = "${merge(var.tags, map("Name", format("%s-public-%d", var.name, count.index + 1)))}"
}

resource "aws_internet_gateway" "main" {
  count  = "${var.create ? 1 : 0}"
  vpc_id = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}" # TODO: Workaround for issue #11210

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_route_table" "public" {
  count  = "${var.create ? 1 : 0}"
  vpc_id = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}" # TODO: Workaround for issue #11210

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = "${merge(var.tags, map("Name", format("%s-public_route", var.name)))}"
}

resource "aws_route_table_association" "public" {
  count = "${var.create ? length(var.public_sub_cidr) : 0}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

##
## Public NAT
##

resource "aws_eip" "nat_eip" {
  count = "${var.create && var.nat_count != "-1" ? var.nat_count : var.create ? length(var.public_sub_cidr) : 0}"
  vpc   = true

  tags = "${merge(var.tags, map("Name", format("%s-nat-eip-%d", var.name, count.index + 1)))}"
}

resource "aws_nat_gateway" "nat" {
  count = "${var.create && var.nat_count != "-1" ? var.nat_count : var.create ? length(var.public_sub_cidr) : 0}"

  allocation_id = "${element(aws_eip.nat_eip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s-%d", var.name, count.index + 1)))}"
}
