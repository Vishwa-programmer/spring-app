#!/bin/bash
echo "Starting deployment..."

# Stop and remove existing container
docker stop spring-app || true
docker rm spring-app || true

# Remove old image
docker rmi spring-app:latest || true

# Build new Docker image
echo "Building Docker image..."
docker build -t spring-app:latest .

# Run the new container
echo "Starting new container..."
docker run -d --name spring-app -p 8080:8080 spring-app:latest

echo "Deployment completed!"