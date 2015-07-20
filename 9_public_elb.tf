resource "aws_security_group" "kcdc_elb" {
  name = "kcdc-elb-sg"
  description = "KCDC Elastic Load Balancer Security Group"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "KCDC Load Balancer"
  }
}

resource "aws_elb" "kcdc_elb" {
  name = "kcdc-elb"
  subnets = ["${aws_subnet.primary-public.id}","${aws_subnet.secondary-public.id}","${aws_subnet.tertiary-public.id}"]
  security_groups = ["${aws_security_group.kcdc_elb.id}"]
  cross_zone_load_balancing = true
    internal = false
  instances = ["${aws_instance.private_1.id}","${aws_instance.private_2.id}","${aws_instance.private_3.id}"]

  listener {
    instance_port      = 8080
    instance_protocol  = "tcp"
    lb_port            = 8080
    lb_protocol        = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    target              = "HTTP:8080/"
    timeout             = 5
  }
}

output "elb_dns_name" {
    value = "${aws_elb.kcdc_elb.dns_name}"
}
