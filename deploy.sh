#!/usr/bin/env bash
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor="joshuacassidynci/exampleapp" --format="{{.ID}}")

if [ "$CURRENT_INSTANCE" ]
then
  sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
fi
sudo docker pull joshuacassidynci/exampleapp
CONTAINER_EXISTS=$(sudo docker ps -a | grep node_app)
if [ "$CONTAINER_EXISTS" ]
then
  sudo docker rm node_app
fi
sudo docker create -p 8443:8443 --name node_app joshuacassidynci/exampleapp
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt
sudo docker cp ./privatekey.pem node_app:/privatekey.pem
sudo docker cp ./server.crt node_app:/server.crt
sudo docker start node_app
