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
