pipeline {
    agent any

    stages {
        stage('Print Info') {
            steps {
                echo "=========================================="
                echo "Jenkins Pipeline for Student: Baglanuly Abat"
                echo "=========================================="
            }
        }
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t baglanuly-abat-student-api:v1.0-baglanuly-abat .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker images | grep baglanuly-abat-student-api'
            }
        }
    }
}
