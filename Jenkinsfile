pipeline{
    agent {label 'Dev'};
    stages{
        stage("Code Clone from GITHUB"){
            steps{
                git url: "https://github.com/MehulPanchal23/flask-app-ecs.git", branch: "master"
            }
        }
        stage("Trivy FileSystem Scan"){
            steps{
                sh "trivy fs . -o trivyresult.json"
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
        emailext attachLog: true,
                 from: "panchalmehul191@gmail.com",
                 subject: '$DEFAULT_SUBJECT',
                 body: '$DEFAULT_CONTENT',
                 to: "panchalmehul195@gmail.com"
            
        }
    failure {
        emailext attachLog: true,
                 from: "panchalmehul191@gmail.com",
                 subject: '$DEFAULT_SUBJECT',
                 body: '$DEFAULT_CONTENT',
                 to: "panchalmehul195@gmail.com"
            
    }
}
}
