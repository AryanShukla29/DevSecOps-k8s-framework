variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}
