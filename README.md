# Terraform Infrastructure for Go CoffeeShop 🚀

This repository contains the Infrastructure-as-Code (IaC) using Terraform to provision and manage the underlying infrastructure for the Go CoffeeShop microservices-based web application on AWS. This project supports both development and production environments, leveraging DevOps practices for efficient deployment and operation.

## Table of Contents

- [Introduction](#introduction)
- [Purpose](#purpose)
- [Environments](#environments)
- [Key Technologies](#key-technologies)
- [Directory Structure](#directory-structure)
- [Prerequisites](#prerequisites)
- [How to use](#how-to-use)
- [Contact](#-contact)


## Introduction

This GitHub organization [Chuc-Thien-DevOps-Final-Project](https://github.com/Chuc-Thien-DevOps-Final-Project), was created to support the final DevOps assignment for an internship. This repository specifically focuses on defining and deploying the infrastructure required to run the Go CoffeeShop application.

## Purpose

The primary goal of this repository is to define and automate the creation of the necessary AWS infrastructure for the Go CoffeeShop application using Terraform. This includes:

- Provisioning compute resources (EC2 for development, EKS for production).
- Setting up networking infrastructure (VPC, Subnets, Security Groups).
- Establishing a remote state backend using S3 for Terraform state management.

## Environments

This infrastructure is designed to support the following environments:

- **Development:** Deployed on ☁️ EC2 instances utilizing Docker Compose for container orchestration. This provides a lightweight and easily manageable environment for development and testing.
- **Production:** Deployed on a scalable and robust ☸️ EKS (Elastic Kubernetes Service) cluster, with ArgoCD for GitOps-based continuous deployment.


## Key Technologies

This project leverages the following key technologies:

- **🏗️ Terraform:** Infrastructure-as-Code tool for provisioning and managing AWS resources.
- **☁️ AWS (Amazon Web Services):** The cloud provider used for hosting the infrastructure, specifically utilizing:
    - **EC2 (Elastic Compute Cloud):** Virtual servers for the development environment.
    - **EKS (Elastic Kubernetes Service):** Managed Kubernetes service for the production environment.
    - **VPC (Virtual Private Cloud):** Isolated network for the application resources.
    - **S3 Backend:** Amazon S3 for securely storing Terraform state files remotely.
    - **AWS Secrets Manager:**(Potentially) For securely storing and managing sensitive information for RDS.
    - **RDS (Relational Database Service):** (Potentially) for managing the application's database.

## Directory Structure

Explanation of the meaning of each main directory:
- `modules/`: Contains reusable Terraform modules to abstract and simplify the creation of common infrastructure components (EC2 instances, S3 buckets, Security Groups, VPCs).
    - `modules/ec2/`: Module for managing EC2 instances.
    - `modules/s3/`: Module for managing S3 buckets.
    - `modules/security_group/`: Module for managing Security Groups.
    - `modules/vpc/`: Module for managing the Virtual Private Cloud.
    - `modules/eks/`:(update later) Module for managing the Elastic Kubernetes Service.
- `backend/`: Contains the Terraform backend configuration, specify the S3 bucket module with versioning and lock state for remote state management.
- `envs/`: Contains configurations specific to different environments (`dev` and `prod`). .
    - `envs/dev/`: Terraform configurations specifically for the development environment, defining EC2 instances and Docker Compose setup(inline commands).
    - `envs/prod/`: Terraform configurations specifically for the production environment, defining the EKS cluster.(use the exist role)


## Prerequisites

List the necessary software and tools to use this project:

- **Terraform:** Ensure you have the appropriate version of Terraform installed (refer to `.terraform-version` or project documentation if specified).
- **AWS CLI:** The AWS Command Line Interface must be installed and configured with appropriate credentials to access your AWS account.
- **kubectl:** For interacting with the EKS cluster in the production environment.
- **Docker:** Required for running the Go CoffeeShop application locally or within the development EC2 instances.
- **Git:** To clone this repository.

## How to use

Basic steps to deploy the infrastructure:

1.  Clone this repository: 
    ```bash
    git clone https://github.com/Chuc-Thien-DevOps-Final-Project/coffeeshop-infrastructure.git
    ```
2.  Navigate to the desired environment directory (e.g., `cd envs/dev` or `cd envs/prod`).
3.  Initialize Terraform for the specific workspace(opstional):
    ```bash
    terraform init -workspace=<environment_name> 
    #(e.g., `terraform init -workspace=dev` or `terraform init -workspace=prod`). If the workspace doesn't exist, Terraform will prompt you to create it.
    ```

4.  **Apply the configuration:**
    ```bash
    terraform init
    terraform plan
    terraform apply --auto-approve
    ``` 

    ```bash
    # Additional: apply for a specific resource
    terraform apply -target=<RESOURCE_ADDRESS> --auto-approve
    ```
5.  **View the output:**
    ```bash
    terraform output public_ip
    ```
5.  **Destroy the infrastructure:**
    ```bash
    terraform destroy --auto-approve
    ```

6.  **View the Terraform state:**
    ```bash
    terraform state list
    ```
    ```bash
    terraform state show <RESOURCE_NAME>
    ```

## 📬 Contact

For any questions or assistance, please feel free to reach out through the following channels:

* **LinkedIn:** [TranChucThien](https://www.linkedin.com/in/tranchucthien/) 💼
* **Email:** chucthien2@gmail.com 📧