output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_url" {
  description = "Jenkins UI URL"
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "sonarqube_url" {
  description = "SonarQube UI URL"
  value       = "http://${aws_instance.jenkins.public_ip}:9000"
}

output "argocd_url" {
  description = "ArgoCD UI URL"
  value       = "http://${aws_instance.jenkins.public_ip}:8081"
}
