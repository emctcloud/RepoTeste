#!/bin/bash
cd /root/RepoTeste/RepoTeste
git pull origin main
docker build -t myapp .
docker stop $(docker ps -q --filter ancestor=myapp)
docker run -d -p 3000:3000 myapp
