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
                sh '''
                echo "Testing SSH Connection..."
                ls -l "$ANSIBLE_PRIVATE_KEY"
                ssh -i "$ANSIBLE_PRIVATE_KEY" -o StrictHostKeyChecking=no root@167.172.184.59 "echo SSH Connection Successful"
                '''
            }
        }
    }
}

