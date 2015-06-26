resource "aws_instance" "nat" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.primary-public.id}"
  security_groups = ["${aws_security_group.node.id}", "${aws_security_group.nat.id}"]
  availability_zone = "${aws_subnet.primary-public.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"
  source_dest_check = false
  associate_public_ip_address = "true"

  tags = {
    Name = "kcdc-vpc-nat"
  }
  connection {
    user = "ubuntu"
    key_file = "ssh/kcdc_terraform"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo iptables -t nat -A POSTROUTING -j MASQUERADE",
      "sudo sh -c 'echo 1 > /proc/sys/net/ipv4/conf/all/forwarding'"
    ]
  }
}
