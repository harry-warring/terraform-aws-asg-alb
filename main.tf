terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}



resource "aws_instance" "myserver" {
  ami                         = "ami-0e858a9b9fb8b4917"
  instance_type               = "m7i-flex.large"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.instance.id]
  user_data                   = file("user_data.sh")


  tags = {
    Name = "SampleServer"
  }
}


