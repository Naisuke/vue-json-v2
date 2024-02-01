## Projeto Vue-cli com Json-Server
[Repositório](https://bitbucket.org/balflex/vuejsonserve/src/master/)

### 1. Criando os arquivos Dockerfile, docker-compose.yml e .dockerignore

```
touch Dockerfile docker-compose.yml .dockerignore
```

### 2. Dockerfile

```
FROM node:latest

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&\
    apt-get install -y nodejs

RUN npm install -g @vue/cli

RUN npm install -g json-server

RUN mkdir /app

WORKDIR /app

COPY . /app

EXPOSE 8000 3000 8080
```

### 3. docker-compose.yml

```
version: '3.7'

services:
  vue-ui:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
      - /app/node_modules
    ports:
      - "8000:8000"
      - "8080:8080"
    command: vue ui --headless --port 8000 --host 0.0.0.0
    container_name: vue-ui
  vue-json:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
      - /app/node_modules
    ports:
      - "3000:3000"
    command: npm run backend
    container_name: vue-json
   
```

### 4. dockerignore

```
node_modules
.git
.gitignore
```

Em seguida:

```
docker-compose up
```

Acessa o container vue-ui:

```
vue create .
```
### 5. Seta as configurações do Vue:

```
- Manually select features
- Seleciona:
    Babel
    Router
- npm run serve
- git config --global --add safe.directory /app
-npm run serve
```
**obs**:  Selecionar Router

### 6. Permissão para alterar os arquivos:

```
sudo chown -R $USER:$USER .
```

### 7. Cria a pasta db e o arquivo Json:

**obs**: Nesse caso o Json vai servir como uma API fake.

```
mkdir db
```

```
touch db/db.json
```
**ExemploJson**
```
{
    "ingredientes": {
      "paes": [
        {
          "id": 1,
          "tipo": "Italiano Branco"
        }
      ],
      "carnes": [
        {
          "id": 1,
          "tipo": "Maminha"
        }
      ],
      "opcionais": [
        {
          "id": 1,
          "tipo": "Bacon"
        }
      ]
    },
    "status": [
      {
        "id": 1,
        "tipo": "Solicitado"
      }
    ],
    "burgers": [ ]
  }
```
No package.json:

```
"scripts": {
    "serve": "vue-cli-service serve",
    "build": "vue-cli-service build",
    "backend": "json-server --host 0.0.0.0 --watch db/db.json"}
```

```
docker-compose up --build
```
Se precisar:

```
npm run serve
```

 




