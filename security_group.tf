#Defining local values
locals {
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}


resource "aws_security_group" "instance" {
  name   = "terraform-example-instance"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description     = "HTTP"
    from_port       = local.http_port
    to_port         = local.http_port
    protocol        = local.tcp_protocol
    security_groups = [aws_security_group.sg_alb.id] # ALB to reach EC2
  }


  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }

}
