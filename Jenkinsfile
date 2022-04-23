pipeline {
    agent any

    triggers {
        githubPush()
    }

    options {
        ansiColor('xterm')
    }

    stages {
        stage ("Paso 0: Prepare scripts") {
            steps {
                script {
                    sh "chmod +x ./scripts/fetch_secrets.sh"
                    sh "chmod +x ./scripts/terraform-plan.sh"
                    sh "chmod +x ./scripts/terraform-apply.sh"
                }
            }
        }
        stage("Paso 1: Terraform init"){
            steps {
                script {
                    sh "echo 'Terraform init!'"
                    sh "terraform init"
                }
            }
        }
        stage ("Paso 3: terraform plan") {
            steps {
                script {
                    echo "Terraform plan"
                    sh "./scripts/terraform-plan.sh"
                }
            }
        }
        stage ("Paso 4: Approve apply") {
            steps {
                script {
                    input message: 'Approve Terraform apply?'
                }
            }
        }
        stage ("Paso 5: terraform apply") {
            steps {
                script {
                    echo "Terraform apply!"
                    sh "./scripts/terraform-apply.sh"
                }
            }
        }
    }
    post {
        always {
            sh "echo 'fase always executed post'"
        }
        success {
            sh "echo 'fase success'"
        }
        failure {
            sh "echo 'fase failure'"
        }
    }
}