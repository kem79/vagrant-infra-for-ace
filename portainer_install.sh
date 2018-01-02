#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.

echo "Install portainer"
sudo docker pull portainer/portainer
sudo docker run --name portainer --network=isolated_nw --ip=192.168.0.5 -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" -d portainer/portainer

echo "portainer installation complete!"
