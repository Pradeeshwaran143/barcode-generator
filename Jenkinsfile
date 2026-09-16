pipeline {
    agent any

    environment {
        IMAGE_NAME = "barcode-generator"
        CLUSTER_NAME = "barcode-cluster"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t ${IMAGE_NAME}:latest -f docker/Dockerfile .'
            }
        }

        stage('Load Image into Kind') {
            steps {
                echo 'Loading Docker image into Kind...'
                sh 'kind load docker-image ${IMAGE_NAME}:latest --name ${CLUSTER_NAME}'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo 'Applying Terraform configuration...'
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Ansible Verification') {
            steps {
                echo 'Running Ansible verification...'
                sh 'ansible-playbook ansible/setup.yml'
            }
        }

        stage('Verify Kubernetes') {
            steps {
                echo 'Checking Kubernetes deployment...'
                sh 'kubectl rollout status deployment/barcode-deployment'
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }

    post {
        success {
            echo 'Barcode Generator CI/CD pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD pipeline failed. Check the stage logs.'
        }
    }
}