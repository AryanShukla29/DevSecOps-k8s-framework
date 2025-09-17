output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
 
output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}
 
output "sonarqube_url" {
  value = "http://${aws_instance.jenkins.public_ip}:9000"
}
 
output "argocd_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8081"
}
 
# Helpful instructions for first login
output "credentials_info" {
  value = <<EOT
 
================= ACCESS CREDENTIALS =================
 
👉 Jenkins:
   URL: http://${aws_instance.jenkins.public_ip}:8080
   Initial Admin Password:
   Run: ssh -i <your-key.pem> ubuntu@${aws_instance.jenkins.public_ip}
        sudo cat /var/lib/jenkins/secrets/initialAdminPassword
 
👉 SonarQube:
   URL: http://${aws_instance.jenkins.public_ip}:9000
   Default Username: admin
   Default Password: admin
 
👉 ArgoCD:
   URL: http://${aws_instance.jenkins.public_ip}:8081
   Default Username: admin
   Default Password:
   Run: ssh -i <your-key.pem> ubuntu@${aws_instance.jenkins.public_ip}
        docker exec -it argocd argocd admin initial-password
 
=====================================================
EOT
}
 