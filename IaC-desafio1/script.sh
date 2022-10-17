#!/bin/bash

echo "Criando os diretórios..."

cd /
sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

echo "Criando os grupos..."
sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

echo "Criando os usuários..."
sudo useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd joao -c "Joao" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd sebastiana -c "Sebastiana" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd roberto -c "Roberto" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd amanda -c "Amanda" -s /bin/bash -m -p $(openssl passwd  Senha123)
sudo useradd rogerio -c "Rogerio" -s /bin/bash -m -p $(openssl passwd  Senha123)

echo "Atribuindo usuários aos grupos..."
sudo usermod -G GRP_ADM carlos
sudo usermod -G GRP_ADM maria
sudo usermod -G GRP_ADM joao

sudo usermod -G GRP_VEN debora
sudo usermod -G GRP_VEN sebastiana
sudo usermod -G GRP_VEN roberto

sudo usermod -G GRP_SEC josefina
sudo usermod -G GRP_SEC amanda
sudo usermod -G GRP_SEC rogerio

echo "Atribuindo grupos aos diretórios..."
sudo chgrp GRP_ADM /adm
sudo chgrp GRP_VEN /ven
sudo chgrp GRP_SEC /sec

echo "Alterando permissões de acesso..."
sudo chmod 777 /publico
sudo chmod 770 /adm
sudo chmod 770 /ven
sudo chmod 770 /sec
