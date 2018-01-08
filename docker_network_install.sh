#!/usr/bin/env bash
# Not used now, keep it if we need to isolate the network in the future.
echo "Setup Docker repo"
sudo docker network create --subnet=192.168.0.0/16 --gateway=192.168.0.1 isolated_nw
echo "Installation complete!"
