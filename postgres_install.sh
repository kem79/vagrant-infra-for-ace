#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep pg
if [ $? -eq 0 ]
  then
  echo "Stop and remove postgres"
  sudo docker stop pg
  sudo docker rm pg
fi

# mandatory to run elk
echo "vm.max_map_count=262144" >> /etc/sysctl.conf

echo "Install Postgres"
sudo docker pull postgres
sudo docker run --name pg \
                -p 5432:5432 \
                -e POSTGRES_USER=guest \
                -e POSTGRES_PASSWORD=guest \
                -d postgres

echo "rabbit mq installation complete!"
