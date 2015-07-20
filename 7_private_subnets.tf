/*resource "aws_subnet" "primary-private" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "10.50.0.0/21"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.kcdc_nat"]
  tags {
    Name = "KCDC Private Subnet 2A"
  }
}

resource "aws_subnet" "secondary-private" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "10.50.64.0/21"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.kcdc_nat"]
  tags {
    Name = "KCDC Private Subnet 2B"
  }
}

resource "aws_subnet" "tertiary-private" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "10.50.128.0/21"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.kcdc_nat"]
  tags {
    Name = "KCDC Private Subnet 2C"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.kcdc_nat.id}"
  }
  tags {
    Name = "KCDC Private Network"
  }
}

resource "aws_route_table_association" "primary-private" {
  subnet_id = "${aws_subnet.primary-private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "secondary-private" {
  subnet_id = "${aws_subnet.secondary-private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "tertiary-private" {
  subnet_id = "${aws_subnet.tertiary-private.id}"
  route_table_id = "${aws_route_table.private.id}"
}*/
