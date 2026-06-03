pipeline {
	agent any
	stages {
	stage ('Build') {
		steps {
			echo 'Building docker image...'
			sh 'docker build -t nginx_img .'
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
			sh 'docker build -t myuniquedevopsacr.azurecr.io/my-nginx-image:${BUILD_NUMBER} .'
		}
	}

	stage ('Push img to azure') {
		steps {
			echo 'pusing img to azure..'
			sh 'az acr login --name myuniquedevopsacr'
			sh 'docker push myuniquedevopsacr.azurecr.io/my-nginx-image:${BUILD_NUMBER}'
		}
	}
}




