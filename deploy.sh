#!/bin/bash
docker stop myapp || true
docker rm myapp || true
docker rmi myapp:latest || true
docker build -t myapp:latest .
docker run -d --name myapp -p 8080:8080 myapp:latest