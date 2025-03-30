pipeline {
    agent any

    environment {
        ANSIBLE_PRIVATE_KEY = credentials('ansible-weather-app-private-key')  // Jenkins credential ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }

        stage('Execute Ansible') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ansible-weather-app-private-key', keyFileVariable: 'SSH_KEY')]) {
                    sh '''
                    echo "Testing SSH Connection..."
                    ls -l $SSH_KEY
                    chmod 600 $SSH_KEY
                    ssh -i $SSH_KEY -o StrictHostKeyChecking=no root@167.172.184.59 "echo SSH Connection Successful"
                    ansible-playbook -i inventory.ini --private-key=$SSH_KEY main.yaml
                    '''
                }
            }
        }
    }
}

