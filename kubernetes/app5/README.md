O frontend estará no dispositivo do usuário. 
O backend estará no cluster.
O banco de dados também estará no cluster.
==================
Será criada uma imagem docker com o mysql:5.7
o banco vai se chamar "meubanco".
O arquivo sql.sql tem as instruções para criação de uma tabela.
Dentro da pasta database:
> docker build . -t szalbuque/meubanco:1.0
> docker login
> docker push szalbuque/meubanco:1.0
----------
Deployment do database (sem réplicas). Os dados ficarão armazenados dentro do pod (sem persistência).
> kubectl.exe apply -f .\dbdeployment.yml
====================
O backend é uma aplicação bem simples em php que recebe os dados do frontend e inclui um registro no database.
Na pasta backend, gerar a imagem:
> docker build . -t szalbuque/php:1.0
> docker push szalbuque/php:1.0
Fazer o deployment:
> kubectl.exe apply -f .\php-deployment.yml
Vai gerar as 3 réplicas e o serviço php-service.
Liberar a porta 30005 no firewall da VM:
> gcloud compute firewall-rules create backend --allow tcp:30005
==================
Frontend vai rodar na minha máquina. No arquivo js.js, substituir o IP desta linha:
 $.ajax({
        url: "http://35.224.5.250:30005/",
Pelo IP externo de uma das réplicas.
Abrir o index.html no navegador para testar.
=================

Para acessar o banco de dados e ver os registros incluídos:
kubectl.exe exec --tty --stdin nomedonómysql -- /bin/bash
# mysql -u root -h 127.0.0.1 -p
mysql> use meubanco;
mysql> select * from mensagens;
mysql> exit
# exit
