# Barcode Generator DevOps Project

A simple web-based Barcode Generator application deployed using a complete DevOps workflow with Docker, Kubernetes, Terraform, Ansible, Jenkins, and GitHub.

## 📌 Project Overview

This project demonstrates how a web application can be containerized, deployed to a Kubernetes cluster, managed using Infrastructure as Code, verified using Ansible, and automated through a Jenkins CI/CD pipeline.

The application allows users to enter a value and generate a CODE128 barcode directly in the browser.

## 🎯 Objectives

- Develop a simple Barcode Generator web application.
- Containerize the application using Docker.
- Deploy the application to Kubernetes using Kind.
- Manage Kubernetes resources using Terraform.
- Verify the deployment using Ansible.
- Automate the complete deployment process using Jenkins.
- Store and manage source code using GitHub.
- Implement automatic Jenkins builds when changes are pushed to GitHub.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| HTML | Web application structure |
| CSS | User interface styling |
| JavaScript | Barcode generation |
| JsBarcode | CODE128 barcode generation |
| Docker | Application containerization |
| Kind | Local Kubernetes cluster |
| Kubernetes | Application deployment and service |
| Terraform | Infrastructure as Code |
| Ansible | Deployment verification |
| Jenkins | CI/CD automation |
| Git | Version control |
| GitHub | Source code repository |

## 📁 Project Structure

```text
barcode-generator/
│
├── app/
│   ├── index.html
│   ├── style.css
│   └── script.js
│
├── docker/
│   └── Dockerfile
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/
│   ├── main.tf
│   └── .terraform.lock.hcl
│
├── ansible/
│   └── setup.yml
│
├── Jenkinsfile
├── README.md
└── .gitignore