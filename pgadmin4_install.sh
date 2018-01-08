#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep pga4
if [ $? -eq 0 ]
  then
  echo "Stop and remove pgadmin4"
  sudo docker stop pga4
  sudo docker rm pga4
fi

echo "Install pgadmin4"
sudo docker pull dpage/pgadmin4
sudo docker run -d -p 80:80 \
                   -e PGADMIN_DEFAULT_EMAIL=guest \
                   -e PGADMIN_DEFAULT_PASSWORD=guest \
                   --name pga4 \
                   dpage/pgadmin4

echo "pgadmin4 installation complete!"