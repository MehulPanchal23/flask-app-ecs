pipeline{
    agent {label 'Dev'};
    stages{
        stage("Code Clone from GITHUB"){
            steps{
                git url: "https://github.com/MehulPanchal23/flask-app-ecs.git", branch: "master"
            }
        }
        stage("build image"){
            steps{
                sh "docker build -t flaskapptest ."
            }
        }
        stage("Push Image to Docker HUB"){
            steps{
                withCredentials([usernamePassword(
                    credentialsId: "dockerhubcred",
                    passwordVariable: "dockerhubpass",
                    usernameVariable: "dockerhubuser"
                    )]){
                sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                sh "docker image tag flaskapptest ${env.dockerhubuser}/flaskapptest"
                sh "docker push ${env.dockerhubuser}/flaskapptest:latest"
                }
            }
        }
        stage("deployment"){
           steps{ 
               sh "docker compose up -d"
           }
        }
        
    }
post {
    success {
        emailext from: "panchalmehul191@gmail.com",
                 to: "panchalmehul195@gmail.com"
            
        }
    failure {
        emailext from: "panchalmehul191@gmail.com",
                 to: "panchalmehul195@gmail.com"
            
    }
}
}
