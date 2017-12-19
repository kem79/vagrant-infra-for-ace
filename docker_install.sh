echo "Update package manager"
sudo apt-get update

echo "Setup Docker repo"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Install Docker"
sudo apt-get update
sudo apt-get install docker-ce -y
# sudo docker run hello-world # To test docker install

echo "Installation complete!"
