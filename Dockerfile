FROM node:latest

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&\
    apt-get install -y nodejs

RUN npm install -g @vue/cli

RUN npm install -g json-server

RUN mkdir /app

WORKDIR /app/api

COPY . /app

EXPOSE 8000 3000 8080
