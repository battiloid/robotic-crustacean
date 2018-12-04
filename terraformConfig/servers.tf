data "aws_ami" "basic_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2*ebs*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "image-id"
    values = ["ami-01aeea5586d1cb5e9"]
  }

  owners = ["137112412989"]
}

data "aws_ami" "docker_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "image-id"
    values = ["ami-0cd3dfa4e37921605"]
  }

  owners = ["137112412989"]
}

resource "aws_instance" "bastion" {
  count = "${var.create && var.bastion_servers_count != -1 ? var.bastion_servers_count : var.create ? length(var.public_sub_cidr) : 0}"

  # iam_instance_profile = "${var.instance_profile != "" ? var.instance_profile : module.consul_auto_join_instance_role.instance_profile_id}"
  # ami           = "${var.bastion_image_id != "" ? var.bastion_image_id : element(concat(data.aws_ami.basic-ami.*.id, list("")), 0)}" # TODO: Workaround for issue #11210
  ami = "${data.aws_ami.basic_ami.id}"

  instance_type = "${var.data_instance_size}"

  key_name = "${var.bastion_ssh_key_name}"

  # key_name      = "${var.ssh_key_name != "" ? var.ssh_key_name : module.ssh_keypair_aws.name}"

  # user_data     = "${element(data.template_file.bastion_init.*.rendered, count.index)}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  vpc_security_group_ids = [
    "${element(concat(aws_security_group.bastion.*.id, list("")), 0)}",
  ]
  tags = "${merge(var.tags, map("Name", format("%s-bastion-%d", var.name, count.index + 1), "Main", var.name))}"
}
