#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep co_mysql
if [ $? -eq 0 ]
  then
  echo "Stop and remove postgres"
  sudo docker stop co_mysql
  sudo docker rm co_mysql
fi

echo "Install mysql"
sudo docker pull mysql
sudo docker run --name co_mysql \
                -p 3306:3306 \
                -e MYSQL_USER=guest \
                -e MYSQL_PASSWORD=guest \
                -d mysql

echo "mysql installation complete!"
