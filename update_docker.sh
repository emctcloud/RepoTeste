#!/bin/bash

# Navegar para o diretório do repositório
cd /root/RepoTeste/RepoTeste || { echo "Falha ao navegar para o diretório do repositório"; exit 1; }

# Puxar as últimas alterações do repositório
git pull origin main || { echo "Falha ao puxar as últimas alterações"; exit 1; }

# Construir a imagem Docker
docker build -t myapp . || { echo "Falha ao construir a imagem Docker"; exit 1; }

# Parar e remover qualquer container que esteja usando a porta 3000
docker ps -q --filter "publish=3000" | xargs -r docker stop || { echo "Falha ao parar os contêineres"; exit 1; }
docker ps -q --filter "publish=3000" | xargs -r docker rm || { echo "Falha ao remover os contêineres"; exit 1; }

# Iniciar um novo container na porta 3000
docker run -d -p 3000:3000 myapp || { echo "Falha ao iniciar o novo contêiner"; exit 1; }

echo "Script executado com sucesso"

