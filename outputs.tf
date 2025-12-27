/*
output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip

}

output "aws_instance_private_ip" {
    value = aws_instance.myserver.private_ip
}

*/
output "alb_dns_name" {
  value       = aws_lb.load_balancer.dns_name
  description = "The domain name of the load balancer"
}
