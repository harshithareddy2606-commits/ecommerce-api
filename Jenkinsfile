pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
<<<<<<< HEAD
=======

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }
>>>>>>> 07628c0265a0697201de7231fd2247234a3a8dc7
    }
}
