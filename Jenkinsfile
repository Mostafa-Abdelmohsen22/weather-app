pipeline {
    agent any 
    environment{
        PATH = 
    }
    stages {
        stage('Git') { 
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/simple-java-app'
                 withMaven {
                sh "mvn clean verify"
                }
            }
        }
        stage('MavenBuild') { 
            steps {
                sh "mvn clean "
            }
        }
        stage('Deploy') { 
            steps {
                echo 'Deploy Completed ..........................' 
            }
        }
    }
}