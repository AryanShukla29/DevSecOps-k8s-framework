#!/bin/bash
docker build -t myrepo/devsecops-validator:latest .
docker tag myrepo/devsecops-validator:latest
your-dockerhub-username/devsecops-validator:latest
docker push your-dockerhub-username/
devsecops-validator:latest