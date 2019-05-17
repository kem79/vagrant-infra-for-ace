#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep mongodb
if [ $? -eq 0 ]
  then
  echo "Stop and remove mongodb"
  sudo docker stop mongodb
  sudo docker rm mongodb
fi

echo "Install mongo"
sudo docker pull mongo
sudo docker run --name mongodb \
                -p 27017:27017 \
                -e MONGO_INITDB_ROOT_USERNAME=admin \
                -e MONGO_INITDB_ROOT_PASSWORD=secret \
                -d mongo

echo "mongo installation complete!"
