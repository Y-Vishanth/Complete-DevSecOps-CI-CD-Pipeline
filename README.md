

# 🚀 End-to-End DevSecOps Pipeline using Jenkins 

---

## 📌 Introduction

This project demonstrates how to build a **production-style DevSecOps CI/CD pipeline** using Jenkins.

👉 In simple terms:
Whenever code is pushed → it is **scanned, built, tested for quality, containerized, scanned again, and pushed to AWS ECR automatically**.

---

## 🎯 What You Will Learn

* Jenkins Controller vs Agent setup
* SSH-based Jenkins Agent configuration
* SonarQube integration for code quality
* Trivy for vulnerability scanning
* Docker image creation
* AWS ECR integration
* Real-world CI/CD pipeline flow

---

## 🧠 Simple Understanding 

Think like this:

1. You write code
2. Jenkins checks if it is secure
3. Jenkins checks if it is good quality
4. Jenkins builds your app
5. Jenkins creates a Docker image
6. Jenkins checks the image again
7. Jenkins uploads it to the cloud

👉 Everything happens automatically.

---

# 🏗️ Project Architecture

```text
Developer → GitHub → Jenkins Controller → Jenkins Agent
                                ↓
                         Trivy FS Scan
                                ↓
                   Build + SonarQube Analysis
                                ↓
                         Docker Build
                                ↓
                      Trivy Image Scan
                                ↓
                         Push to AWS ECR
```

---

# 🧪 Lab 1: Install Jenkins Controller on EC2

## Step 1: Create EC2 Instance

* Launch Ubuntu instance
* Allow ports:

  * 22 (SSH)
  * 8080 (Jenkins)

---

## Step 2: Connect to Instance

```bash
ssh -i your-key.pem ubuntu@your-ip
```

---

## Step 3: Install Java

```bash
sudo apt update
sudo apt install openjdk-21-jdk -y
```

---

## Step 4: Install Jenkins

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y
```

---

## Step 5: Start Jenkins

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

---

## Step 6: Access Jenkins UI

```
http://<your-ip>:8080
```

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

# 🔗 Lab 2: Configure SSH-Based Jenkins Agent

## Why Agent?

👉 Controller = brain
👉 Agent = worker

---

## Steps

* Create new EC2 instance
* Install Java
* Create `jenkins` user
* Generate SSH key (controller)
* Copy key to agent
* Add node in Jenkins UI

---

# 🔍 Lab 3: Install SonarQube on EC2

## Why SonarQube?

👉 Checks code quality and bugs

---

## Steps

* Install Java
* Install PostgreSQL
* Configure DB
* Download SonarQube
* Start service

Access:

```
http://<sonarqube-ip>:9000
```

---

# 🐳 Dockerfile (Your Implementation)

👉 Refer to the Dockerfile in this repository for implementation details.


---

# ⚙️ Jenkins Pipeline (Your Implementation)

👉 Refer to the Jenkinsfile in this repository for the complete pipeline configuration.

---

# 🔐 Pipeline Stages Explained (Very Simple)

### 1. Trivy FS Scan

👉 Checks your code for vulnerabilities

---

### 2. Build + SonarQube

👉 Builds app + checks code quality

---

### 3. ECR Login

👉 Connects Jenkins to AWS

---

### 4. Docker Build

👉 Converts your app into container

---

### 5. Trivy Image Scan

👉 Checks Docker image security

---

### 6. Push to ECR

👉 Uploads image to AWS

---

# 🔁 Trigger Pipeline on Git Push

* Configure GitHub webhook
* Pipeline runs automatically

---

# 🧾 Post Actions in Jenkins

* Clean workspace
* Show logs
* Track failures

---


---

# 📈 How This Pipeline Can Be Improved

* Add Kubernetes deployment 
* Add notifications (Slack/Email)
* Add automated tests
* Use secrets manager
* Add monitoring

---

# ✅ Conclusion

This project demonstrates:

* Real DevSecOps pipeline
* Security integrated in CI/CD
* Automated build + scan + deploy

---

