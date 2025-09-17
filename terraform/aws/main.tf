provider "aws" {
  region  = var.aws_region
  profile = "default"
}
 
# Security group for Jenkins, SonarQube, ArgoCD
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH, Jenkins, SonarQube, and ArgoCD"
  vpc_id      = var.vpc_id
 
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict SSH to your IP
  }
 
  ingress {
    description = "Jenkins UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "SonarQube UI"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    description = "ArgoCD UI"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    description = "Allow All Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "jenkins-sg"
  }
}
 
# EC2 Instance for Jenkins + DevSecOps stack
resource "aws_instance" "jenkins" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true
 
  user_data = <<-EOF
    #!/bin/bash
    set -e
 
    # Update packages
    sudo apt-get update -y || sudo yum update -y
 
    # Install Git, Docker, and Docker Compose
    sudo apt-get install -y git docker.io docker-compose || sudo yum install -y git docker docker-compose
 
    # Enable Docker
    sudo systemctl enable docker
    sudo systemctl start docker
 
    # Add ubuntu to Docker group
    sudo usermod -aG docker ubuntu
 
    # Clone your repo
    cd /home/ubuntu
    git clone https://github.com/AryanShukla29/DevSecOps-k8s-framework.git
    cd DevSecOps-k8s-framework
 
    # Run docker-compose
    sudo docker-compose up -d
  EOF
 
  tags = {
    Name = "jenkins-server"
  }
}
 