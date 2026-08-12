pipeline{
  agent any
  stages{
    stage('checkout from git'){
      steps{
        checkout scm
      }
    }

    stage('Terrafrom Init'){
      steps{
        sh 'terraform init'
      }
    }

    stage('Terraform Format'){
      steps{
        sh 'terraform fmt -check'
      }
    }

    stage('Terraform plan '){
       steps {
        withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_Tokens_Jiten']
        ]) {
            sh 'terraform plan -out=tfplan'
        }
    }
  }

    stage('Terraform Apply'){
      steps{
        input 'Apply Infrastructure?'
         withCredentials([
            [$class: 'AmazonWebServicesCredentialsBinding',
             credentialsId: 'AWS_Tokens_Jiten']
        ]) {
            sh 'terraform apply -auto-approve tfplan'
        } 
      }
    }
}
}