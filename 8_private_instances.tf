resource "template_file" "init" {
  filename = "init.tpl"
}

resource "aws_instance" "private_1" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.primary-private.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.primary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-1"
  }

  user_data = "${template_file.init.rendered}"
}

resource "aws_instance" "private_2" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.secondary-private.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.secondary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-2"
  }

  user_data = "${template_file.init.rendered}"
}

resource "aws_instance" "private_3" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.tertiary-private.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.tertiary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-3"
  }

  user_data = "${template_file.init.rendered}"
}
