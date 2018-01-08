#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep portainer
if [ $? -eq 0 ]
  then
  echo "Stop and remove portainer"
  sudo docker stop portainer
  sudo docker rm portainer
fi

echo "Install portainer"
sudo docker pull portainer/portainer
sudo docker run --name portainer \
                -p 9000:9000 \
                -v "/var/run/docker.sock:/var/run/docker.sock" \
                -d portainer/portainer

echo "portainer installation complete!"
