#!/usr/bin/env bash
# Check if there is instance running with the image name we are deploying
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

# If an instance does exist stop the instance
if [ "$CURRENT_INSTANCE" ]
then
  sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
fi

# Pull down the instance from dockerhub
sudo docker pull $IMAGE_NAME

# Check if a docker container exists with the name of node_app if it does remove the container
CONTAINER_EXISTS=$(sudo docker ps -a | grep node_app)
if [ "$CONTAINER_EXISTS" ]
then
  sudo docker rm node_app
fi

# Create a container called node_app that is available on port 8443 from our docker image
sudo docker create -p 8443:8443 --name node_app $IMAGE_NAME
# Write the private key to a file
echo $PRIVATE_KEY > privatekey.pem
# Write the server key to a file
echo $SERVER > server.crt
# Add the private key to the node_app docker container
sudo docker cp ./privatekey.pem node_app:/privatekey.pem
# Add the server key to the node_app docker container
sudo docker cp ./server.crt node_app:/server.crt
# start the node_app container
sudo docker start node_app
