
#Creating ALB

resource "aws_lb" "load_balancer" {
  name               = "load-balancer"
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.subnet_2.id]
  security_groups    = [aws_security_group.sg_alb.id]
}

#Defining a listener for ALB

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

#Security Group for LB

resource "aws_security_group" "sg_alb" {
  name   = "application-load-balancer-sg"
  vpc_id = aws_vpc.vpc.id

  #Allow inbound HTTP requests
  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  #Allow all outbound requests
  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }
}

#Creating a target group

resource "aws_lb_target_group" "target_group_asg" {
  name     = "asg-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "rule_asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_asg.arn
  }
}


resource "aws_lb_target_group_attachment" "web_instance" {
  target_group_arn = aws_lb_target_group.target_group_asg.arn
  target_id        = aws_instance.myserver.id
  port             = 80
}
