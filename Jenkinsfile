pipeline {
    agent any

    environment {
        IMAGE_NAME = "pavithranc/getting_started_with_docker"
        TAG = "latest"
        CONTAINER_NAME = "my-container"
        PORT = "3001"
    }

    stages {

        stage('Clone Repository') {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main', url: 'https://github.com/pavithran-c/Docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo "Logging into Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'ef492499-ea8f-4274-b1cb-b1aadea4cb8f', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to Docker Hub..."
                sh 'docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:$TAG'
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo "Deploying Docker container..."
                sh 'docker run -d -p $PORT:$PORT --name $CONTAINER_NAME $IMAGE_NAME:$TAG'
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
