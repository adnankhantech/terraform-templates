### Introduction
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

If you're new to Terraform and want to get started creating infrastructure, please check out [Getting Started](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) guides on HashiCorp's learning platform for setting up based on your choice of OS.

This repository contains terraform templates for setting up infrastructure on AWS and to begin with basic services like EC2, S3, AMI, Security Group, VPC, RDS. Will add up templates with more resources moving ahead like EKS, Lambda, API Gateway, Cloudfront etc.

#### Install Terraform on MacOS using Homebrew
- First, install the HashiCorp tap, a repository of all Terraform Homebrew packages.
  
  ``` brew tap hashicorp/tap ```
- Now, install Terraform with hashicorp/tap/terraform
  
  ``` brew install hashicorp/tap/terraform ```

#### Verify the installation

  ``` terraform -help ```

#### Clone the repository
``` 
git clone https://github.com/adnankhantech/terraform-templates.git
cd aws-services
 ```

#### Initialize Terraform project 
``` terraform init ```

#### Format your configuration
``` terraform fmt ```

#### Validate your configuration
``` terraform validate ```

#### Apply Terraform configuration
``` terraform apply ```

