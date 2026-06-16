pipeline {
	agent any
	stages {
	stage ('Build') {
		steps {
			echo 'Building docker image...'
			bat 'docker build -t nginx_img .'
		}
	}

	stage ('Test') {
		steps {
			echo 'Testing..'
		}
	}

	stage ('Deploy') {
		steps {
			echo 'Deploying..'
		}
	}
	
	
	stage ('Checkout') {
		steps {
			echo ('Checking out')
			checkout scm
		}
	}

	stage('Build docker image'){
		steps {
			echo 'building docker img..'
			bat 'docker build -t myuniquedevopsacr.azurecr.io/my-nginx-image:%BUILD_NUMBER% .'
		}
	}

	stage ('Push img to azure') {
		steps {
			echo 'pusing img to azure..'
			bat 'az acr login --name myuniquedevopsacr'
			bat 'docker push myuniquedevopsacr.azurecr.io/my-nginx-image:%BUILD_NUMBER%'
		}
	}
}








