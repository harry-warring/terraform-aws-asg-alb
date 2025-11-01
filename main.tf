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
  ami           = "ami-0199d4b5b8b4fde0e"
  instance_type = "t3.micro"

  tags = {
    Name = "SampleServer"
  }
}

#Editting this file again

