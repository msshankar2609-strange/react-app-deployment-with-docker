#!/bin/bash

# login into DockerHub
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

# stop old container
docker stop react || true
docker rm react || true

# build image
docker build -t react-ci-cd .

# run container
docker run -d -it --name react -p 80:80 react-ci-cd

# tag image
docker tag react-ci-cd shankar2609strange/react-app:ci-cd

# push image
docker push shankar2609strange/react-app:ci-cd
