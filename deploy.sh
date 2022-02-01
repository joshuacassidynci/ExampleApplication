#!/usr/bin/env bash 
sudo apt update && sudo apt install nodejs npm
# Install pm2 which is a production process manager for Node.js with a built-in load balancer.
sudo npm install -g pm2
# stop any instance of our application running currently
pm2 stop example_app
# change directory into folder where application is downloaded
cd ExampleApplication/
# Install application dependancies
npm install
# Redirect all traffic from port 3000 to port 80
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000
# Start the application with the process name example_app using pm2
pm2 start ./bin/www --name example_app --env=production
