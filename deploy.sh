#!/usr/bin/env bash
cd ExampleApplication/
docker rm $(docker stop $(docker ps -a -q --filter ancestor=node_app --format="{{.ID}}"))
docker build -t node_app .
docker run -p 8443:8443 -d node_app
