# CloudDevOps Project — Saeed Gebaly

A complete end‑to‑end **Cloud & DevOps** project showcasing: Infrastructure as Code, CI/CD pipelines, Kubernetes deployment, GitOps with ArgoCD, and containerized application delivery on AWS.

This README is written fully in **English** and structured for professional recruiters, instructors, and GitHub visitors.

---

## 🚀 Project Overview
This repository contains a fully production‑grade DevOps pipeline built on AWS, including:

### 🔧 **Infrastructure as Code (Terraform)**
- Custom VPC (CIDR, Subnets, Route Tables)
- Internet Gateway + NAT Gateway
- EKS Cluster (managed by AWS EKS)
- Node Group (worker nodes)
- IAM Roles + Policies

### 🐳 **Dockerized Web Application**
- Flask application
- Dockerfile for containerization
- requirements.txt

### ☸️ **Kubernetes Deployment**
- Namespace: `ivolve`
- Deployment + ReplicaSets
- LoadBalancer Service (exposes the app publicly)

### ⚙️ **CI/CD: GitHub Actions**
- Build & push Docker images to DockerHub
- Auto‑deploy to EKS cluster
- Fully automated pipeline triggered on every push

### 🔄 **GitOps with ArgoCD**
- Application auto-sync from GitHub
- Self-healing + auto-rollbacks
- Visual UI for real-time cluster state

### 📦 **Ansible (Optional Component)**
- Dynamic AWS EC2 inventory
- Roles: common, docker, jenkins
- Playbook for server provisioning

### 📊 **Monitoring Stack (Optional)**
- Prometheus Operator
- Grafana Dashboards

---

## 📁 Repository Structure
```
/ (root)
├── .github/
│   └── workflows/deploy.yaml        # CI/CD pipeline
├── ansible/
│   ├── inventory/
│   ├── roles/
│   └── playbook.yaml
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── static/                          # App assets
├── templates/                       # HTML templates
├── Dockerfile
├── app.py
├── requirements.txt
├── README.md                        # You are here
└── Terraform/
    ├── network/
    ├── eks/
    └── backend/ (optional)
```

---

## 🏗️ Terraform — Deploying Infrastructure
From the Terraform directory:

```bash
cd Terraform
terraform init
terraform apply
```

This will automatically create:
- VPC + Subnets + NAT
- EKS Cluster
- Node Group
- IAM roles

You can destroy everything using:
```bash
terraform destroy
```

---

## ☸️ Connect kubectl to EKS
```bash
aws eks update-kubeconfig --name devops-eks --region us-east-1
kubectl get nodes
```

---

## 🐳 Build & Run App (Local Test)
```bash
docker build -t devops-app .
docker run -p 5000:5000 devops-app
```

---

## ⚙️ CI/CD with GitHub Actions
The pipeline will:
1. Build Docker image
2. Push to DockerHub
3. Apply kubernetes manifests to EKS

Pipeline file:
```
/.github/workflows/deploy.yaml
```

Trigger deployment by:
```bash
git add .
git commit -m "deploy"
git push
```

---

## 🔄 ArgoCD — GitOps
After installing ArgoCD on EKS:
- UI exposed with LoadBalancer
- Login using the generated admin password
- Sync your GitHub repo with the `k8s/` folder
- ArgoCD automatically applies updates on every commit

---

## 🧪 Testing the Application
```bash
kubectl get all -n ivolve
```
Look for the **LoadBalancer EXTERNAL-IP**, then open in browser:
```
http://<elb-dns-url>/
```
You should see the Flask app running.

