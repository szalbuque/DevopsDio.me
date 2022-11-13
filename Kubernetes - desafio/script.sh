#!/bin/bash
echo “Criando as imagens...”

docker build -t szalbuque/projetobackend:1.0 backend/.
docker build -t szalbuque/dbase:1.0 database/.

echo “Fazendo o upload das imagens para o Docker Hub”

docker push szalbuque/projetobackend:1.0
docker push szalbuque/dbase:1.0

echo “Criando os serviços no cluster kubernetes...”
kubectl apply -f ./services.yml

echo "Implantando a especificação do Persistent Volume..."
kubectl create -f ./persistentvolume.yml

echo "Implantando a especificação do Persistent Volume Claim"
kubectl create -f ./pvc.yml

echo “Fazendo o deploy do banco de dados...”
kubectl apply -f ./dbasedeploy.yml

echo "Fazendo o deploy da aplicação backend..."
kubectl apply -f ./deployment.yml
