#Launch Configuration

resource "aws_launch_template" "template" {
  name_prefix            = "asg_template"
  image_id               = "ami-0e858a9b9fb8b4917"
  instance_type          = "m7i-flex.large"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = base64encode(file("user_data.sh"))

  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_autoscaling_group" "scaling" {
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.public_subnet.id, aws_subnet.subnet_2.id]
  #target_group_arns   = [aws_lb_target_group.target_group_asg.arn]
  health_check_type = "ELB"
  min_size          = 2
  desired_capacity  = 2
  max_size          = 5

  tag {
    key                 = "Name"
    value               = "asg-group"
    propagate_at_launch = true # tag will be applied to every EC2 instance launched by ASG
  }
}


