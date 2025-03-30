pipeline {
    agent any 
    environment{
        ANSIBLE_PRIVATE_KEY=credentials('ansible-weather-app-private-key')
    }
    stages {
        stage('Build') { 
            steps {
               git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }
    stage('Execute Ansible') { 
            steps {
            //    ansiblePlaybook credentialsId: 'private-ket-p', disableHostKeyChecking: true, installation: 'ansible', inventory: 'inventory.ini', playbook: 'main.yaml', vaultTmpPath: ''
               ansible-playbook -i inventory.ini --private-key=$ANSIBLE_PRIVATE_KEY main.yaml
            }
        }
    }
}