pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/weather-app'
            }
        }

        stage('Step 3: Deploy Application with Ansible') { 
            steps {
                script {
                    echo '🔑 Setting up SSH for deployment...'
                    sshagent(['weather-app']) {
                        sh """
                        echo '🚀 Running Ansible playbook...'
                        ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini main.yaml\
                        --private-key \$SSH_AUTH_SOCK
                        """
                    }
                    echo '✅ Deployment completed!'
                }
            }
        }
    }
}

// install ssh agent
// add a passwrd of machhine