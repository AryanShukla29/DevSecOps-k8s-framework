<p align="center">

# ⚙️ **DevSecOps Kubernetes Deployment Validation Framework**

A fully automated **DevSecOps CI/CD Framework** built using  
**Terraform • Jenkins • SonarQube • Trivy • ArgoCD • Python Validation Engine**  
to ensure secure, scalable, and reliable cloud-native delivery.

![License: MIT](https://img.shields.io/badge/License-MIT-black.svgbrect automates the **entire Software Development Lifecycle (SDLC)** — from **Infrastructure as Code (IaC)** and **Continuous Integration** to **Security Scanning**, **Continuous Deployment**, and **Kubernetes Manifest Validation**.  
It ensures compliance, reliability, and scalability at every stage of your DevSecOps pipeline.

---

## 🏗️ Architecture

┌───────────────────────────────┐
                │          Developer            │
                │  (Pushes Code to GitHub)      │
                └──────────────┬────────────────┘
                               │
                               ▼
                    ┌────────────────────┐
                    │   Jenkins Server   │
                    │ (CI/CD Orchestration)
                    ├────────────────────┤
                    │  - Build Docker Image
                    │  - Run Trivy Scan
                    │  - SonarQube Analysis
                    │  - Push Image to Registry
                    │  - Trigger ArgoCD Deploy
                    └────────────────────┘
                               │
                               ▼
          ┌───────────────────────────────┐
          │        ArgoCD Server          │
          │ (Continuous Deployment)       │
          └──────────────┬────────────────┘
                         │
                         ▼
         ┌────────────────────────────────────┐
         │       Kubernetes Cluster           │
         │  - Validated Deployment via        │
         │    Custom Python Validation Tool   │
         │  - Security Policies Enforced      │
         └────────────────────────────────────┘
                         │
                         ▼
       ┌────────────────────────────┐
       │   Monitoring & Reporting   │
       │  (Trivy, SonarQube, Logs)  │
       └────────────────────────────┘

---

## 🧩 Validation Framework

The **Python-based Validation Engine** enforces Kubernetes best practices **before deployment** — stopping insecure or misconfigured workloads.

### 🔍 Validations Performed
- ✅ **runAsNonRoot** — Containers never run as root  
- ✅ **Liveness & Readiness Probes** — Ensures app health checks  
- ✅ **Resource Limits** — Prevents resource overuse  
- ✅ **Spec Validation** — Checks containers exist in manifests  
- ❌ Rejects insecure or incomplete deployments automatically  

### **Run Example**

Sample Output
 
{
  "doc": 1,
  "container": "validator-demo-container",
  "status": "success",
  "reason": "All checks passed ✅"
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
 
🔄 End-to-End CI/CD (Jenkins + Docker)
 
🧩 Static Code Analysis (SonarQube)
 
🧠 Container Security (Trivy)
 
⚙️ GitOps Deployment (ArgoCD)
 
🧾 Manifest Validation (Python Framework)
 
☁️ Multi-Cloud Ready (AWS, Azure, GCP)
 
 
 
---
 
🧠 Tech Stack
 
Python • Terraform • AWS • Docker • Kubernetes • Helm • Jenkins • SonarQube • Trivy • ArgoCD
 
 
---
 
👨‍💻 Author
 
Aryan Shukla
DevOps & Cloud Engineer | M.Tech (BITS Pilani)
📧 Reach out on GitHub Discussions
 
 
---
 
📜 License
 
 
Licensed under the MIT License © 2025 Aryan Shukla
 
 
---
 
<p align="center">
Made with ❤️ and ☁️ DevSecOps Automation
</p>
```
---
