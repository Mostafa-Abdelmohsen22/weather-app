pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }

    stages {
        stage('Execute Ansible') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ansible-weather-app-private-key', keyFileVariable: 'SSH_KEY')]) {
                    sh '''
                    echo "Testing SSH Connection..."
                    chmod 600 $SSH_KEY
                    ssh -i $SSH_KEY -o StrictHostKeyChecking=no root@167.172.184.59 "echo SSH Connection Successful"
                    ansible-playbook -i inventory.ini --private-key=$SSH_KEY main.yaml
                    '''
                }
            }
        }
    }
}