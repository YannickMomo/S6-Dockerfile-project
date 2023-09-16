ARG TAG=latest
FROM ubuntu:$TAG
LABEL maintainer="DEVOPS EASY LEARNING"
RUN apt update
RUN apt-get update && \
    apt-get install -y \
    ansible \
    curl \
    git \
    gnupg \
    jq \
    linux-headers-$(uname -r) \
    openssh-client \
    postgresql-client \
    python3 \
    kubectl \
    kubens \
    nodejs \
    npm \
    vim \
    wget \
    python3-pip \
    net-tools \
    iputils-ping \
    terraform \
    awscli \
    default-jre \
    default-jdk \
    maven \
    helm \
    ufw \
    go
WORKDIR /BUILDER
ARG APP_NAME=s6
ARG ENV=learning_dockerfile
ENV APP_NAME=$APP_NAME
ENV ENV=$ENV
ENV TEAM=Devops
USER root
RUN mkdir -p /root/REPOS
EXPOSE 80-3029
EXPOSE 3031-4595
EXPOSE 4597-4877
EXPOSE 4879-6000
RUN apt install git -y && \
    mkdir -p /root/REPOS/GIT && \
    git clone https://github.com/devopseasylearning/KFC-app.git && \
    git clone https://github.com/devopseasylearning/awesome-compose.git && \
    git clone https://github.com/devopseasylearning/production-deployment.git && \
    cp -r ./KFC-app /root/REPOS/GIT/ && \
    cp -r ./awesome-compose /root/REPOS/GIT/ && \
    cp -r ./production-deployment /root/REPOS/GIT/
COPY K8S .
COPY backend .
RUN mkdir FRONTEND
COPY ./frontend/* ./FRONTEND
RUN useradd builder
USER builder
CMD ["/bin/bash"]