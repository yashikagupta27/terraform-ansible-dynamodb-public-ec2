## Project Overview

This project demonstrates how to automate AWS infrastructure deployment using **Terraform** and configure an EC2 instance using **Ansible**.
The infrastructure includes a **Public EC2 instance** and an **AWS DynamoDB table**. Terraform is used to provision the AWS resources, while Ansible is used to configure the EC2 instance and install the necessary dependencies required for interacting with DynamoDB.

The main objective of this project is to showcase **Infrastructure as Code (IaC)** and **configuration management** practices in a cloud environment.

---

## Technologies Used

* **AWS EC2**
* **AWS DynamoDB**
* **Terraform**
* **Ansible**
* **IAM**
* **Linux**

---

## Project Architecture

1. Terraform provisions AWS infrastructure.
2. A **public EC2 instance** is launched.
3. A **DynamoDB table** is created in AWS.
4. IAM permissions allow the EC2 instance to access DynamoDB.
5. Ansible connects to the EC2 instance.
6. Required packages and scripts are installed using Ansible.
7. The EC2 instance can now communicate with DynamoDB.

## Implementation Steps

### 1. Provision Infrastructure using Terraform

* Configure AWS provider
* Create EC2 instance in a **public subnet**
* Create a DynamoDB table
* Configure IAM permissions for DynamoDB access

### 2. Configure EC2 using Ansible

* Define inventory for EC2 instance
* Establish SSH connection
* Install required dependencies
* Execute configuration scripts

### 3. Verify Deployment

* Check EC2 instance connectivity
* Verify DynamoDB table creation
* Confirm communication between EC2 and DynamoDB

---

## Key Learning Outcomes

* Understanding **Infrastructure as Code with Terraform**
* Automating server configuration using **Ansible**
* Deploying and managing resources in **AWS**
* Integrating **EC2 with DynamoDB**

