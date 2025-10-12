---
 
# 🚀 DevSecOps Kubernetes Deployment Validation Framework  
 
A fully automated **DevSecOps CI/CD Framework** built using **Terraform, Jenkins, SonarQube, Trivy, ArgoCD, and a Custom Kubernetes Validation Engine** to ensure secure, scalable, and reliable cloud-native application delivery.  
 
---
 
## 🧠 Overview  
 
This project automates the **entire software development lifecycle (SDLC)** — from **infrastructure provisioning** and **code analysis** to **security scanning**, **continuous deployment**, and **Kubernetes manifest validation**.  
It ensures code quality, security compliance, and deployment reliability across all DevSecOps stages using modern tools and best practices.  
 
---
 
## 🏗️ Architecture  
 
![Architecture Diagram](docs/architecture.png)  
 
| Layer | Tool | Function |
|-------|------|-----------|
| **Infrastructure as Code (IaC)** | Terraform | Provisions AWS EC2, networking, and Jenkins environment |
| **Continuous Integration (CI)** | Jenkins | Builds, tests, scans, and automates deployment pipelines |
| **Code Quality** | SonarQube | Performs static code analysis for quality and maintainability |
| **Container Security** | Trivy | Scans Docker images for vulnerabilities before deployment |
| **Continuous Delivery (CD)** | ArgoCD | GitOps-based delivery to Kubernetes clusters |
| **Validation** | Custom Python Framework | Validates Kubernetes manifests for security and compliance |
 
---
 
## 🧩 Validation Framework  
 
The **Python-based Validation Engine** ensures all Kubernetes manifests and Helm charts follow DevSecOps and K8s best practices.  
It prevents insecure or misconfigured workloads from being deployed.  
 
### Validations Performed:
- ✅ `runAsNonRoot` — Ensures containers do not run as root  
- ✅ Liveness & Readiness Probes — Enforces health checks  
- ✅ Resource Limits — Prevents resource abuse  
- ✅ Deployment Structure — Validates `.spec.template.spec.containers`  
- ❌ Rejects manifests that fail validation automatically  
 
### **Command Example:**  
```bash
python validation-framework/app/main.py --manifest k8s/deployment.yaml
 
Sample Output:
 
{
  "doc": 1,
  "container": "validator-demo-container",
  "status": "success",
  "reason": "All checks passed"
}
 
 
---
 
⚙️ Setup & Usage
 
1️⃣ Clone Repository
 
git clone https://github.com/AryanShukla29/DevSecOps-k8s-framework.git
cd DevSecOps-k8s-framework
 
2️⃣ Provision Infrastructure
 
cd terraform/aws
terraform init
terraform apply -auto-approve
 
3️⃣ Launch Services
 
sudo docker-compose up -d
 
4️⃣ Access Points
 
Service URL
 
Jenkins http://<EC2_PUBLIC_IP>:8080
SonarQube http://<EC2_PUBLIC_IP>:9000
ArgoCD http://<EC2_PUBLIC_IP>:8081
 
 
 
---
 
🛡️ Features
 
🚀 Automated Infrastructure Provisioning (Terraform)
 
🔄 End-to-End CI/CD Pipeline (Jenkins + Docker)
 
🧩 Static Code Analysis (SonarQube)
 
🧠 Container Vulnerability Scanning (Trivy)
 
⚙️ GitOps Continuous Delivery (ArgoCD)
 
🧾 Pre-Deployment Manifest Validation (Python Framework)
 
☁️ Cloud-Agnostic Design (AWS-ready, Azure/GCP extendable)
 
 
 
---
 
🧠 Tech Stack
 
Python • Terraform • AWS • Docker • Kubernetes • Helm • Jenkins • SonarQube • Trivy • ArgoCD
 
 
---
 
👨‍💻 Author
 
Aryan Shukla
DevOps & Cloud Engineer | M.Tech (BITS Pilani)
📧 LinkedIn
 
 
---
 
📜 License
 
Licensed under the MIT License © 2025 Aryan Shukla
 
---
