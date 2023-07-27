pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('test1')
    }
    stages { 

        stage('Build docker image') {
            steps {  
                sh 'docker build -t jenish007/flaskapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'test1', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                }
        }
        stage('push image') {
            steps{
                sh 'docker push jenish007/flaskapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
