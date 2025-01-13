#!/bin/bash

# Navegar para o diretório do repositório
cd /root/RepoTeste/RepoTeste

# Puxar as últimas alterações do repositório
git pull origin main

# Construir a imagem Docker
docker build -t myapp .

# Parar e remover qualquer container que esteja usando a porta 3000
docker ps -q --filter "publish=3000" | xargs -r docker stop
docker ps -q --filter "publish=3000" | xargs -r docker rm

# Iniciar um novo container na porta 3000
docker run -d -p 3000:3000 myapp

