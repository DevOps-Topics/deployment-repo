// Jenkinsfilees
pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage ('test the build') {
            agent {
                docker {
                    image 'node:20'
                }
            }

            steps {
                sh " mkdir -p ~/.npm "
                sh " npm config set cache ~/.npm "
                sh "npm install --save-dev jest jest-junit "
                sh 'npm test -- --ci --reporters=jest-junit'
            }
            
            post {
                
                always {
                    junit 'reports/junit.xml'
            }
        }

        }
        stage('Build Docker Image') {

            when {
                expression {
                    return  currentBuild.result == null  || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    docker.build("hello-node:${BUILD_NUMBER}")
                }
            }
        }

        stage('Run Hello World') {
            steps {
                sh 'docker run -d -p 8181:8181 hello-node:${BUILD_NUMBER}'
            }
        }
    }
}
