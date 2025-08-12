#!/bin/bash
set -e  # Exit on any error

# Variables
IMAGE_NAME="devsecops-validator"
DOCKERHUB_USER="your-dockerhub-username"  # Change to your Docker Hub username
TAG="latest"

# Build Docker image
echo "🚀 Building Docker image..."
docker build -t ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG} .

# Push to Docker Hub
echo "📤 Pushing image to Docker Hub..."
docker push ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}

echo "✅ Docker image pushed: ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}"
