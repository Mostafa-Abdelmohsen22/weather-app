pipeline {
    agent any

    environment {
        MAVEN_VERSION = "3.9.6"
        MAVEN_HOME = "/opt/maven"
        PATH = "${MAVEN_HOME}/bin:${PATH}"
    }

    stages {
        stage('Install Maven') {
            steps {
                sh '''
                # Check if Maven is already installed
                if [ ! -d "$MAVEN_HOME" ]; then
                    echo "Installing Maven..."
                    mkdir -p $MAVEN_HOME
                    wget -q https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -O /tmp/maven.tar.gz
                    tar -xzf /tmp/maven.tar.gz --strip-components=1 -C $MAVEN_HOME
                    rm /tmp/maven.tar.gz
                fi

                # Verify Maven installation
                $MAVEN_HOME/bin/mvn --version
                '''
            }
        }

        stage('Git') { 
            steps {
                git branch: 'main', url: 'https://github.com/Ahmed363-Essam/simple-java-app'
                echo 'Git Clone COMPLETED'
            }
        }

        stage('Maven Build') { 
            steps {
                sh "$MAVEN_HOME/bin/mvn -B -DskipTests clean package"
            }
        }

        stage('Deploy') { 
            steps {
                echo 'Deploy Completed'
            }
        }
    }
}
