variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key used for SSH"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description= "AMI ID to use"
  type =string

  
}
 variable "instance_type" {
  description = "EC2 instance type"
  type =string
  default = "t2.micro"
   
 }
