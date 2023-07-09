// *********************** Jenkins file for PROD server##********************//

pipeline {
  agent any
  environment{
    registry = "chiranjib1992/first-nodejs"
    registryCredential = 'dockerhub'
	REGISTRY_ADDRESS = "https://registry.hub.docker.com"
    dockerImage = ''
	COMPOSE_FILE = "docker-compose.yml"
    REGISTRY_AUTH = credentials("dockerhub")
    }
	
  stages {
 
  stage('Verify') {
            steps {
                sh '''
                    docker version
                    docker-compose version
                '''
            }
        }
		
		
    stage('clean') {
       steps {
         sh 'sh dockerclean.sh'
       }
    }
	
    stage('build') {
      steps {
			script { 
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
				}
      }
    }



stage('Push Image') {
  steps{    
	script {
			docker.withRegistry( '', registryCredential ) {
			dockerImage.push("$BUILD_NUMBER")
			dockerImage.push('latest')
			}
    }
  }
}

  
}

}