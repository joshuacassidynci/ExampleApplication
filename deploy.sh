#!/usr/bin/env bash
cd ExampleApplication/
npm install
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor=node_app --format="{{.ID}}")

if [ "$CURRENT_INSTANCE" ]
then
  sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
fi

echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

sudo docker build -t node_app .
sudo docker run -p 8443:8443 -d node_app
