# AWS Highly Available Infrastructure using Terraform

## 📌 Project Overview
This project provisions a highly available AWS infrastructure using Terraform.  
It includes a VPC, EC2 instances behind an Application Load Balancer, Auto Scaling,  
CloudWatch monitoring, and an S3 backend for remote state management.

This project was built as part of hands-on learning to strengthen Terraform  
and AWS architecture skills.

---

## ⚙️ Technologies Used
- Terraform
- AWS EC2
- Application Load Balancer
- Auto Scaling Group
- Amazon CloudWatch
- Amazon S3 (Remote Backend)

---

## 🏗️ Architecture Components
- **VPC** with networking configuration
- **EC2 instances** launched using Auto Scaling
- **Application Load Balancer** to distribute traffic
- **Security Groups** for controlled access
- **CloudWatch alarms** for monitoring EC2 metrics
- **S3 backend** for Terraform remote state

---

## 📂 Project Structure
vpc.tf # VPC and networking
security_group.tf # Security groups
main.tf # Core infrastructure resources
autoscaling.tf # Auto Scaling Group
load_balancer.tf # Application Load Balancer
cloud_watch.tf # CloudWatch alarms and monitoring
s3_backend.tf # Terraform remote state backend
s3_bucket.tf # S3 bucket for state storage
user_data.sh # EC2 bootstrap script
variables.tf # Input variables
outputs.tf # Output values
.terraform.lock.hcl # Terraform dependencies
.gitignore # Ignored files
README.md # Project documentation

---

## 🚀 How to Deploy
1. Clone the repository:
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
Initialize Terraform:

terraform init
Review the execution plan:

terraform plan
Apply the configuration:

terraform apply
Confirm deployment by checking AWS console:

EC2 instances

CloudWatch alarms

Load Balancer

Auto Scaling group

📊 Monitoring
CloudWatch monitors EC2 metrics such as CPU utilization

Alarms are configured to trigger when thresholds are exceeded

Tested using EC2 workload to validate alarm triggers

🧹 Cleanup
To avoid AWS charges:
terraform destroy

🎯 Key Learnings
Designing highly available AWS architectures

Using Auto Scaling and Load Balancers

Implementing monitoring with CloudWatch

Managing Terraform state using S3 backend

Structuring Terraform projects using multiple files

🔮 Future Improvements

Use Terraform modules for better reusability

Add HTTPS using AWS ACM

Integrate with CI/CD pipeline for automated deployments

👤 Author
Harjinder Singh Warring
AWS Certified Solutions Architect – Associate
CompTIA Security+
