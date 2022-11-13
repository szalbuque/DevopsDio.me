#!/bin/bash
echo “Criando as imagens...”

docker build -t szalbuque/projetobackend:1.0 backend/.
docker build -t szalbuque/projeto-database:1.0 database/.

echo “Fazendo o upload das imagens para o Docker Hub”

docker push szalbuque/projetobackend:1.0
docker push szalbuque/projeto-database:1.0

echo “Criando os serviços no cluster kubernetes...”
kubectl apply -f ./services.yml

echo “Fazendo os deployments...”
kubectl apply -f ./deployment.yml
