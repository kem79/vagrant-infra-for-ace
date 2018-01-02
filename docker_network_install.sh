#!/usr/bin/env bash
echo "Setup Docker repo"
sudo docker network create --subnet=192.168.0.0/16 --gateway=192.168.0.1 isolated_nw
echo "Installation complete!"
