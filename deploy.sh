#!/usr/bin/env bash
docker rm $(docker stop $(docker ps -a -q --filter ancestor=node_app --format="{{.ID}}"))
docker build -t node_app .
docker run -p 8443:8443 -d node_app
