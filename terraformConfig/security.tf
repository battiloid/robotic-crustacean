##
## Bastion Security Group and Rules
##

resource "aws_security_group" "bastion" {
  count       = "${var.create && var.bastion_servers_count > 0 ? 1 : 0}"
  name_prefix = "${var.name}-bastion-"
  description = "Security Group for ${var.name} Bastion hosts"
  vpc_id      = "${var.create_vpc ? element(concat(aws_vpc.main.*.id, list("")), 0) : var.vpc_id}" # TODO: Workaround for issue #11210

  tags = "${merge(var.tags, map("Name", format("%s-bastion", var.name)))}"
}

resource "aws_security_group_rule" "ssh_public" {
  count = "${var.create && var.bastion_servers_count > 0 ? 1 : 0}"

  security_group_id = "${aws_security_group.bastion.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_public" {
  count = "${var.create && var.bastion_servers_count > 0 ? 1 : 0}"

  security_group_id = "${aws_security_group.bastion.id}"
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
