# Deploying a Node.js Application on AWS EC2

## Project Overview

This project demonstrates the deployment of a Node.js web application on an AWS EC2 Ubuntu instance. The objective is to automate the server setup and application deployment using shell scripting while following basic DevOps practices.

---

## Technologies Used

* AWS EC2
* Ubuntu Linux
* Git & GitHub
* Node.js
* npm
* Shell Scripting
* SSH

---

## Project Architecture

User Browser → Internet → AWS EC2 Instance → Node.js Application

---

## Prerequisites

Before deployment, ensure the following:

* AWS Account
* IAM User with Administrator Access
* EC2 Ubuntu Instance
* Key Pair (.pem file)
* Git Installed
* Node.js Installed

---

## Step 1: Create IAM User

1. Login to AWS Management Console.
2. Navigate to IAM Service.
3. Create a new IAM User.
4. Select:

   * AWS Management Console Access
   * Password Authentication
5. Attach:

   * AdministratorAccess Policy
6. Create the user and login using the new credentials.

---

## Step 2: Launch EC2 Instance

Configuration:

* Operating System: Ubuntu Server
* Instance Type: t2.micro
* Storage: Default
* Security Group Rules:

  * SSH (22)
  * HTTP (80)
  * HTTPS (443)
  * Custom TCP (3000)

Create and download the key pair file (.pem).

---

## Step 3: Connect to EC2

Change key permissions:

```bash
chmod 400 Node.pem
```

Connect to the instance:

```bash
ssh -i Node.pem ubuntu@<PUBLIC_IP>
```

---

## Step 4: Server Setup Script

File: setup-node.sh

Purpose:

* Update packages
* Install Node.js
* Install npm
* Install Git

Commands executed:

```bash
sudo apt update -y
sudo apt upgrade -y

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs git

node -v
npm -v
git --version
```

Run the script:

```bash
chmod +x setup-node.sh
./setup-node.sh
```

---

## Step 5: Deploy Application Script

File: deploy-app.sh

Purpose:

* Clone application repository
* Install dependencies
* Start application

Commands executed:

```bash
git clone https://github.com/verma-kunal/AWS-Session.git

cd AWS-Session

npm install

npm start
```

Run the script:

```bash
chmod +x deploy-app.sh
./deploy-app.sh
```

---

## Step 6: Environment Variables

Create .env file:

```env
DOMAIN=""
PORT=3000
STATIC_DIR="./client"

PUBLISHABLE_KEY=""
SECRET_KEY=""
```

---

## Step 7: Application Verification

Verify Node.js:

```bash
node -v
npm -v
```

Verify application:

```bash
curl http://localhost:3000
```

Or open in browser:

```text
http://<PUBLIC_IP>:3000
```

---

## Challenges Faced

### SSH Connection Refused

Error:

```bash
ssh: connect to host <IP> port 22: Connection refused
```

Resolution:

* Verified EC2 instance status
* Checked Security Group inbound rules
* Allowed SSH access on port 22
* Confirmed correct Ubuntu username

---

## Security Measures

* SSH key authentication
* Restricted security group rules
* Separate IAM user for administration
* Ubuntu package updates

---

## Project Outcomes

Successfully:

* Created AWS infrastructure
* Connected to EC2 through SSH
* Installed Node.js environment
* Automated server setup using shell scripts
* Deployed Node.js application
* Verified application accessibility

---

## Author

Riya Singh

Date: 11 June 2026

