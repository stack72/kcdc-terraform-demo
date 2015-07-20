/*resource "aws_security_group" "kcdc_web" {
  name = "kcdc-web-sg"
  description = "Default security group that allows SSH inbound and all outbound traffic from all instances in the VPC"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    security_groups = ["${aws_security_group.kcdc_elb.id}"]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "kcdc-web-sg"
  }
}

resource "aws_instance" "private_1" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.primary-private.id}"
  security_groups = ["${aws_security_group.kcdc_node.id}","${aws_security_group.kcdc_web.id}"]
  availability_zone = "${aws_subnet.primary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-1"
  }

  connection {
    user = "ubuntu"
    key_file = "ssh/kcdc_terraform"
    bastion_host = "${aws_instance.kcdc_nat.public_ip}"
    agent = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y wget ruby",
      "wget 'https://www.dropbox.com/s/myg0bi3j7j8eyt1/simpledemo_1.0.0_amd64.deb'",
      "sudo dpkg -i simpledemo_1.0.0_amd64.deb",
      "sudo gem install pleaserun",
      "sudo pleaserun --install -p upstart -v 1.5 --name simpledemo /usr/bin/simpledemod",
      "sudo service simpledemo start"
    ]
  }
}

resource "aws_instance" "private_2" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.secondary-private.id}"
  security_groups = ["${aws_security_group.kcdc_node.id}","${aws_security_group.kcdc_web.id}"]
  availability_zone = "${aws_subnet.secondary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-2"
  }

  connection {
    user = "ubuntu"
    key_file = "ssh/kcdc_terraform"
    bastion_host = "${aws_instance.kcdc_nat.public_ip}"
    agent = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y wget ruby",
      "wget 'https://www.dropbox.com/s/myg0bi3j7j8eyt1/simpledemo_1.0.0_amd64.deb'",
      "sudo dpkg -i simpledemo_1.0.0_amd64.deb",
      "sudo gem install pleaserun",
      "sudo pleaserun --install -p upstart -v 1.5 --name simpledemo /usr/bin/simpledemod",
      "sudo service simpledemo start"
    ]
  }
}

resource "aws_instance" "private_3" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.tertiary-private.id}"
  security_groups = ["${aws_security_group.kcdc_node.id}","${aws_security_group.kcdc_web.id}"]
  availability_zone = "${aws_subnet.tertiary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  associate_public_ip_address = "false"

  tags {
    Name = "private-instance-3"
  }

  connection {
    user = "ubuntu"
    key_file = "ssh/kcdc_terraform"
    bastion_host = "${aws_instance.kcdc_nat.public_ip}"
    agent = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y wget ruby",
      "wget 'https://www.dropbox.com/s/myg0bi3j7j8eyt1/simpledemo_1.0.0_amd64.deb'",
      "sudo dpkg -i simpledemo_1.0.0_amd64.deb",
      "sudo gem install pleaserun",
      "sudo pleaserun --install -p upstart -v 1.5 --name simpledemo /usr/bin/simpledemod",
      "sudo service simpledemo start"
    ]
  }
}

output "private_instance_1_ip"{
  value = "${aws_instance.private_1.private_ip}"
}

output "private_instance_2_ip"{
  value = "${aws_instance.private_2.private_ip}"
}

output "private_instance_3_ip"{
  value = "${aws_instance.private_3.private_ip}"
}*/
