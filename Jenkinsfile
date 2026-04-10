pipeline {
  agent { label 'docker-maven-trivy' }
  tools {
    maven 'maven3.9'
  }
  environment {
    SONAR_IP = '172.31.44.21'
    ECR_REGISTRY = '111194325104.dkr.ecr.ap-south-1.amazonaws.com'
  }
  stages {
    stage('Trivy FS Scan') {
      steps {
        sh 'trivy fs --exit-code 1 --severity HIGH,CRITICAL .'
      }
    }
    stage('Build and Sonarqube Analysis') {
      steps {
        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
    sh 'mvn clean verify sonar:sonar \
  -Dsonar.projectKey=DevSecOps_Project \
  -Dsonar.host.url="http://${SONAR_IP}:9000" \
  -Dsonar.token="${SONAR_TOKEN}" \
  -Dsonar.qualitygate.wait=true' 
}
      }
    }
    stage('ECR Login') {
        steps {
            aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${ECR_REGISTRY}
        }
    }
  }
}