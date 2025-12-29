resource "aws_cloudwatch_metric_alarm" "alb_unhealthy" {
  alarm_name          = "alb-unhealthy-hosts"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Minimum"
  threshold           = 3
  alarm_description   = "Alarm when ALB has any unhealthy targets"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    LoadBalancer = aws_lb.load_balancer.arn_suffix
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
