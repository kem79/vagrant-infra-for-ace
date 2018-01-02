#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.

echo "Install pgadmin4"
sudo docker pull dpage/pgadmin4
sudo docker run --name pg_admin --network=isolated_nw --ip=192.168.0.3 -e PGADMIN_DEFAULT_EMAIL=guest -e PGADMIN_DEFAULT_PASSWORD=guest -p 80:80 -d dpage/pgadmin4

echo "pgadmin4 installation complete!"
