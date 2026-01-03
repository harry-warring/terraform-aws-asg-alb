AWS EC2 Monitoring & Alerting using Terraform
📌 Project Overview

This project demonstrates how to provision and monitor AWS infrastructure using Terraform.
It focuses on deploying an EC2 instance and configuring Amazon CloudWatch to monitor CPU utilization and trigger alerts when thresholds are breached.

The goal of this project is to showcase Infrastructure as Code (IaC), cloud monitoring, and operational awareness, which are essential skills for Cloud, DevOps, and SRE roles.

🛠️ Technologies Used

Terraform

AWS EC2

Amazon CloudWatch

CloudWatch Alarms

IAM

AWS CLI

🏗️ Architecture

Terraform provisions:

EC2 instance

Security Group

IAM role (for CloudWatch access)

CloudWatch alarm

CloudWatch monitors:

EC2 CPU Utilization

Alarm triggers when CPU usage exceeds a defined threshold

📂 Project Structure
.
├── provider.tf          # AWS provider configuration
├── variables.tf         # Input variables
├── main.tf              # EC2 and Security Group resources
├── cloudwatch.tf        # CloudWatch alarms and metrics
├── outputs.tf           # Output values
└── README.md            # Project documentation

⚙️ Prerequisites

Before running this project, ensure you have:

An AWS account

AWS CLI configured

Terraform installed

IAM user/role with required permissions

Verify installations:

terraform --version
aws --version

🚀 How to Deploy

Clone the repository:

git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name


Initialize Terraform:

terraform init


Review the execution plan:

terraform plan


Apply the configuration:

terraform apply


Confirm deployment by checking:

EC2 instance in AWS Console

CloudWatch alarms under CloudWatch → Alarms

📊 Monitoring Details

Metric: CPUUtilization

Threshold: Configurable (example: >70%)

Evaluation Period: Defined in Terraform

Action: CloudWatch alarm triggers when threshold is breached

🧹 Cleanup Resources

To avoid unnecessary AWS charges:

terraform destroy

🎯 Key Learnings

Writing modular and reusable Terraform code

Implementing monitoring using CloudWatch

Understanding EC2 performance metrics

Following best practices for IaC

📌 Future Enhancements

Add SNS notifications (Email alerts)

Monitor additional metrics (Memory, Disk)

Auto Scaling Group integration

Convert into a reusable Terraform module

👤 Author

Harjinder Singh Warring

AWS Certified Solutions Architect – Associate

CompTIA Security+

Cloud & DevOps Enthusiast
