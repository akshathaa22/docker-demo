
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'

                sh '''
                docker build \
                -t akshathaadevopsacr.azurecr.io/my-nginx-image:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing image...'

                sh '''
                docker images | grep my-nginx-image
                '''
            }
        }

        stage('Push Image To ACR') {
            steps {
                echo 'Pushing image to ACR...'

                sh '''
                az acr login --name akshathaadevopsacr

                docker push \
                 akshathaadevopsacr.azurecr.io/nginx_img:${BUILD_NUMBER}
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy stage completed'
            }
        }
    }
}