data "aws_ami" "basic-ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "configInstanceOne" {
  ami           = "${data.aws_ami.basic-ami.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${var.instance_names["configInstance1"]}"
  }

  subnet_id = "${aws_subnet.subnetP1.id}"
}

resource "aws_instance" "configInstanceTwo" {
  ami           = "${data.aws_ami.basic-ami.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${var.instance_names["configInstance2"]}"
  }

  subnet_id = "${aws_subnet.subnetP2.id}"
}

resource "aws_instance" "configInstanceThree" {
  ami           = "${data.aws_ami.basic-ami.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${var.instance_names["configInstance3"]}"
  }

  subnet_id = "${aws_subnet.subnetP3.id}"
}

