#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.

echo "Install Postgres"
sudo docker pull postgres
sudo docker run --name pg --network=isolated_nw --ip=192.168.0.2 -e POSTGRES_USER=guest -e POSTGRES_PASSWORD=guest -p 5432:5432 -d postgres

echo "rabbit mq installation complete!"
