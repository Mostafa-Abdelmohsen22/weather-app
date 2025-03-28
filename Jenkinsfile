pipeline {
    agent any 
    stages {
        stage('Git') { 
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/simple-java-app'
            }
        }
        stage('MavenBuild') { 
            steps {
                sh "mvn clean package"
            }
        }
        stage('Deploy') { 
            steps {
                echo 'Deploy Completed ..........................' 
            }
        }
    }
}