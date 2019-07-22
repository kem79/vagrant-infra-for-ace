#!/usr/bin/env bash
echo "Update package manager"
sudo apt-get update

apt-cache madison docker-ce

echo "Setup Docker repo"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -k -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Install Docker"
#sudo apt-get remove docker-ce docker docker-engine docker.io containerd runc -y
sudo apt-get update
sudo apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-trusty
# sudo docker run hello-world # To test docker install

echo "Installation complete!"
