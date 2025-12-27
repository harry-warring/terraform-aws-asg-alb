#!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<html><h1>Hello! World</h1></html>" > /var/www/html/index.html