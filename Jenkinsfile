pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
               git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }
    stage('Execute Ansible') { 
            steps {
               ansiblePlaybook credentialsId: 'private-ket-p', disableHostKeyChecking: true, installation: 'ansible', inventory: 'inventory.ini', playbook: 'main.yaml', vaultTmpPath: ''
            }
        }
    }
}