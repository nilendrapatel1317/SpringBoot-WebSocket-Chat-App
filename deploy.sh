#!/bin/bash

# 1. Build jar
./mvnw clean package -DskipTests

# 2. Build Docker image
docker build -t chat-app -f Dockerfile .

# 3. Tag image
docker tag chat-app nilendrapatel1317/chat-app:latest

# 4. Push to Docker Hub
docker push nilendrapatel1317/chat-app:latest

# 5. Trigger redeploy via Render Deploy Hook
curl -X POST https://api.render.com/deploy/srv-d0j7206uk2gs73biusl0?key=9ZYMqLJPRPQ
