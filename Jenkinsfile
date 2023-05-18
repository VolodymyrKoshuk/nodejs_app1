pipeline {
 
    agent {
        label 'awscli'
    }
    
   parameters {
        string(name: 'docker_tag', description: 'Docker ECR tag', defaultValue: 'main')
    }



    stages {

        stage('Build and push image') {
            environment {
                DOCKER_IMAGE = '224974567407.dkr.ecr.eu-north-1.amazonaws.com/nodejs_app1'
            }

            steps {
                script {
                    // Збирання і тегування зображення
                    sh "docker build -t $DOCKER_IMAGE:${params.docker_tag} ."

                    // Запуск скрипту для входу в ECR реєстр
                    sh './ecr_login.sh'

                    // Пуш зображення до ECR реєстру
                    sh "docker push $DOCKER_IMAGE:${params.docker_tag}"
                }
            }
        }
    }
}
