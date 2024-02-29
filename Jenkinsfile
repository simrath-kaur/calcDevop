
pipeline {
    environment {
        imageName = ""
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    agent any
    stages {
        stage('Git Pull') {
            steps {
                git 'https://github.com/simrath-kaur/CalcDevOp.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Building an Docker Image') {
            steps {
                script {
                    imageName = docker.build "simrathkaur/calc_devops"
                }
            }
        }
        stage('Push The Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-credentials') {
                        imageName.push()
                    }
                }
            }
        }
        stage('Ansible Pull Docker Image') {
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'ansible-deploy/inventory', playbook: 'ansible-deploy/playbook.yml', sudoUser: null
            }
        }
    }
}
