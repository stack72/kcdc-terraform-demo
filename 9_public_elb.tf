/*resource "aws_security_group" "kcdc_elb" {*/
  /*name = "kcdc-elb-sg"*/
  /*description = "KCDC Elastic Load Balancer Security Group"*/
  /*vpc_id = "${aws_vpc.default.id}"*/

  /*ingress {*/
    /*from_port = 80*/
    /*to_port   = 80*/
    /*protocol  = "tcp"*/
    /*cidr_blocks = ["0.0.0.0/0"]*/
  /*}*/

  /*egress {*/
    /*from_port = "0"*/
    /*to_port = "0"*/
    /*protocol = "-1"*/
    /*cidr_blocks = ["0.0.0.0/0"]*/
  /*}*/

  /*tags {*/
    /*Name = "KCDC Load Balancer"*/
  /*}*/
/*}*/

/*resource "aws_elb" "kcdc_elb" {*/
  /*name = "kcdc-elb"*/
  /*subnets = ["${aws_subnet.primary-private.id}","${aws_subnet.secondary-private.id}","${aws_subnet.tertiary-private.id}"]*/
  /*security_groups = ["${aws_security_group.kcdc_elb.id}"]*/
  /*cross_zone_load_balancing = true*/
	/*internal = false*/
  /*instances = ["${aws_instance.private_1.id}","${aws_instance.private_2.id}","${aws_instance.private_3.id}"]*/

  /*listener {*/
    /*instance_port      = 80*/
    /*instance_protocol  = "tcp"*/
    /*lb_port            = 80*/
    /*lb_protocol        = "tcp"*/
  /*}*/

  /*health_check {*/
    /*healthy_threshold   = 2*/
    /*unhealthy_threshold = 2*/
    /*interval            = 10*/
    /*target              = "HTTP:80"*/
    /*timeout             = 5*/
  /*}*/
/*}*/
