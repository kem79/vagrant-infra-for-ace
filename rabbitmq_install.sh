#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep rabbitmq
if [ $? -eq 0 ]
  then
  echo "Stop and remove rabbitmq"
  sudo docker stop rabbitmq
  sudo docker rm rabbitmq
fi

echo "Install Rabbitmq"
sudo docker pull rabbitmq:3-management
sudo docker run -d -p 15672:15672 \
                   -p 5672:5672 \
                   -p 1883:1883 \
                   --name rabbitmq \
                   rabbitmq:3-management

echo "Installation complete!"
