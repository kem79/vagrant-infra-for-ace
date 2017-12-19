# pre-requisite: you already provisioned Docker in your VM.

echo "Install Rabbitmq"
sudo docker pull rabbitmq
sudo docker pull rabbitmq:3-management

sudo docker run -d -p 15672:15672 -p 5672:5672 -p 1883:1883 --name rabbitmq rabbitmq:3-management

echo "Installation complete!"
