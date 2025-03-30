pipeline {
    agent any

    environment{
        ANSIBLE_PRIVATE_KEY=credentials('ansible-weather-app-private-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }

        stage('Execute Ansible') {
            steps {
                sh 'ansible-playbook -i inventory.ini --private-key=$ANSIBLE_PRIVATE_KEY main.yaml'
            }
        }
    }
}