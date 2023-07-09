pipeline {
    agent any
    
    environment {
        registry = "chiranjib1992/first-nodejs"
        dockerImage = ""
    }
    
    stages {
        stage('Verify') {
            steps {
                sh 'docker version'
                sh 'docker-compose version'
            }
        }
        
        stage('Clean') {
            steps {
                sh 'sh dockerclean.sh'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
        }
        
        stage('Test') {
            steps {
                // Run tests against the built Docker image
                sh 'docker run --rm $registry:$BUILD_NUMBER npm test'
            }
        }
        
        stage('Push Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        docker.withRegistry('', "${USERNAME}:${PASSWORD}") {
                            dockerImage.push("$BUILD_NUMBER")
                            dockerImage.push('latest')
                        }
                    }
                }
            }
        }
    }
}
