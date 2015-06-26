resource "aws_subnet" "primary-public" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block = "10.0.32.0/22"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags {
    Name = "KCDC Public Subnet 2A"
  }
}

resource "aws_subnet" "secondary-public" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block = "10.0.96.0/22"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags {
    Name = "KCDC Public Subnet 2B"
  }
}

resource "aws_subnet" "tertiary-public" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block = "10.0.160.0/22"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true

  tags {
    Name = "KCDC Public Subnet 2C"
  }
}


resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "KCDC Public Network"
  }
}

resource "aws_route_table_association" "primary-public" {
  subnet_id = "${aws_subnet.primary-public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "secondary-public" {
  subnet_id = "${aws_subnet.secondary-public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "tertiary-public" {
  subnet_id = "${aws_subnet.tertiary-public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

