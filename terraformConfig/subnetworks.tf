resource "aws_subnet" "subnetP1" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 1)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone1"]}"

  tags {
    Name = "${var.subnet_names["subnetP1"]}"
  }
}

resource "aws_subnet" "subnetX1" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 11)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone1"]}"

  tags {
    Name = "${var.subnet_names["subnetX1"]}"
  }
}

resource "aws_subnet" "subnetP2" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 2)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone2"]}"

  tags {
    Name = "${var.subnet_names["subnetP2"]}"
  }
}

resource "aws_subnet" "subnetX2" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 12)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone2"]}"

  tags {
    Name = "${var.subnet_names["subnetX2"]}"
  }
}

resource "aws_subnet" "subnetP3" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 3)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone3"]}"

  tags {
    Name = "${var.subnet_names["subnetP3"]}"
  }
}

resource "aws_subnet" "subnetX3" {
  cidr_block        = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 8, 13)}"
  vpc_id            = "${aws_vpc.main-vpc.id}"
  availability_zone = "${var.aws_azs["zone3"]}"

  tags {
    Name = "${var.subnet_names["subnetX3"]}"
  }
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.main-vpc.id}"

  ingress {
    cidr_blocks = [
      "${aws_vpc.main-vpc.cidr_block}",
    ]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}
