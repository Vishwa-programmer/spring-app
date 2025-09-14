#!/bin/bash
echo "Starting deployment..."

docker stop spring-app || true
docker rm spring-app || true
docker rmi spring-app:latest || true

echo "Building Docker image..."
docker build -t spring-app:latest .

echo "Starting new container..."
docker run -d --name spring-app -p 8080:8080 spring-app:latest

echo "Deployment completed!"