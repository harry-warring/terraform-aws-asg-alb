output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip

}

output "aws_instance_private_ip" {
    value = aws_instance.myserver.private_ip
}