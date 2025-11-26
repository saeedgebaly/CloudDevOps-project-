# CloudDevOpsProject
Cloud DevOps Project – CI/CD on AWS EKS
A complete end-to-end DevOps project using Terraform, Kubernetes, Docker, GitHub Actions, and Ansible.
---------
Overview
This project demonstrates a full production-like DevOps workflow:

Infrastructure as Code using Terraform

Containerized application using Docker

Kubernetes deployment on AWS EKS

Automated CI/CD using GitHub Actions

Server configuration using Ansible

Full cloud environment on AWS (VPC, Subnets, NAT, EKS, Nodes, LoadBalancer)

The project deploys a sample Python/Flask application on AWS EKS with automated builds and deployments.

 Architecture
---------
Tools & Technologies:

AWS: VPC, Subnets, NAT Gateway, EKS Cluster, EC2

Terraform: Infrastructure provisioning

Docker: Containerized Flask App

Kubernetes: Deployment, Service, Namespace

GitHub Actions: CI/CD pipeline

DockerHub: Container registry

Ansible: Server configuration & automation (optional Jenkins role)

Python/Flask: Sample application

-------------
🧱 Infrastructure (Terraform)
✔ Creates:

Custom VPC

Public & Private Subnets

Internet Gateway

NAT Gateway

Route Tables

EKS Cluster

EKS Node Group

IAM Roles for EKS

To deploy infrastructure:

cd Terraform
terraform init
terraform apply
-----------
🐳 Docker (Application Build)

The Flask app is containerized using a simple Dockerfile:
docker build -t <dockerhub-username>/devops-app:latest .
docker push <dockerhub-username>/devops-app:latest

☸ Kubernetes Manifests
namespace.yaml

Creates project namespace.

deployment.yaml

Deploys the Flask app using DockerHub image.

service.yaml

Creates LoadBalancer service (AWS ELB) to expose the app publicly.

Apply manually:
kubectl apply -f k8s/
---------

🔁 CI/CD – GitHub Actions

Automated pipeline:

Build Stage

Checks out code

Builds Docker image

Pushes image to DockerHub

Deploy Stage

Connects to AWS using GitHub Secrets

Updates kubeconfig

Applies Kubernetes manifests

Automatically deploys new version to EKS

Triggers automatically on every push to main.

Workflow file path:
.github/workflows/deploy.yaml

AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
DOCKERHUB_TOKEN
---------

🤖 Ansible Configuration

Dynamic AWS EC2 inventory:
ansible/inventory/aws_ec2.yaml
Roles included:

common → installs required packages

docker → installs & enables Docker

jenkins → installs Jenkins (optional)

Run Playbook:
ansible-playbook -i ansible/inventory/aws_ec2.yaml ansible/playbook.yaml
-------
🌐 Application Public URL

Once EKS & LoadBalancer are deployed:
http://<elb-dns-name>
You can get the DNS of the LB via:
kubectl get svc -n ivolve
--------
🏁 Project Completed

This project implements a full real-world DevOps workflow on AWS:

✔ Terraform Infrastructure
✔ Docker Image Build
✔ Kubernetes Deployment
✔ AWS EKS Cluster
✔ GitHub Actions CI/CD
✔ Dynamic Inventory + Ansible
✔ Complete cloud architecture
🙌 Author

trigger deployment

Saeed Gebaly
Cloud DevOps Engineer
NTI Cloud & AWS Track
GitHub: https://github.com/saeedgebaly
