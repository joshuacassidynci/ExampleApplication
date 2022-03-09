#!/usr/bin/env bash
cd ExampleApplication/
npm install
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor=node_app --format="{{.ID}}")
if [ -z "$CURRENT_INSTANCE" ]
then
      sudo docker rm $(sudo docker stop $CURRENT_INSTANCE)
fi
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt
sudo docker build -t node_app .
sudo docker run -p 8443:8443 -d node_app

#
# sudo apt update && sudo apt install nodejs npm
# # Install pm2 which is a production process manager for Node.js with a built-in load balancer.
# sudo npm install -g pm2
# # stop any instance of our application running currently
# pm2 stop example_app
# # change directory into folder where application is downloaded
# cd ExampleApplication/
# # Install application dependencies
# npm install
# echo $PRIVATE_KEY > privatekey.pem
# echo $SERVER > server.crt
# # Start the application with the process name example_app using pm2
# pm2 start ./bin/www --name example_app
