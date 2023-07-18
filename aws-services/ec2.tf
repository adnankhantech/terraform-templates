terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

# Create EC2 Instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type          = var.ec2-instance-type
  key_name               = var.ec2-key
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  tags = {
    Name = "AppServerInstanceSetupUsingTerraform"
  }
}

# Import AMI from remote source for EC2 Instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Security Group for EC2 Instance
resource "aws_security_group" "ec2-sg" {
  name        = "${var.ec2-sg-name}"
  description = "${var.ec2-sg-description}"
  vpc_id      =  "vpc-076def459b27c36d6" # change this to your VPC ID 
  dynamic "ingress" {
    for_each = var.ports
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
