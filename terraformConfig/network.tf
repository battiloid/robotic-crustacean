resource "aws_vpc" "main" {
  count = "${var.create && var.create_vpc ? 1 : 0}"

  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = "${merge(var.tags, map("Name", format("%s", var.vpc_name)))}"
}
