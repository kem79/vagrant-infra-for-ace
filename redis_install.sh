#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep redis
if [ $? -eq 0 ]
  then
  echo "Stop and remove redis"
  sudo docker stop redis
  sudo docker rm redis
fi

echo "Install Redis"
sudo docker pull redis
sudo docker run -d \
                   -p 6379:6379 \
                   --name redis \
                   redis

echo "Installation complete!"
