pipeline {
    agent any
    environment {
        ANSIBLE_PRIVATE_KEY = credentials('ansible-weather-app-private-key')
    }
    stages {
        stage('Clone Repository') { 
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }
        
        stage('Execute Ansible') { 
            steps {
                sh 'ANSIBLE_PRIVATE_KEY'
            }
        }
    }
}
