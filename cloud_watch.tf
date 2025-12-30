#Alarm for unhealthy instances in ALB
resource "aws_cloudwatch_metric_alarm" "alb_unhealthy" {
  alarm_name          = "alb-unhealthy-hosts"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "Alarm when ALB has any unhealthy targets"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    LoadBalancer = aws_lb.load_balancer.arn_suffix
  }
}

#Alarm for Instance launced by ASG
resource "aws_cloudwatch_metric_alarm" "asg_instance" {
  alarm_name          = "asg-instance-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  period              = 60
  statistic           = "Minimum"
  threshold           = 2
  alarm_description   = "Alarm when ASG has fewer than 2 healthy instances"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.scaling.name
  }
}

#Alarm for Instance launched without ASG
resource "aws_cloudwatch_metric_alarm" "default_instance" {
  alarm_name          = "default-ec2-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when EC2 CPU > 70%"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.myserver.id
  }
}


resource "aws_sns_topic" "alerts" {
  name = "cloudwatch-alerts"
}


resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "harjinder90singh@gmail.com"
}
