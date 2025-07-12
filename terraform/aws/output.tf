output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
  description = "Public IP of the Jenkins server"
}
