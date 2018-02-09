#!/usr/bin/env bash
# pre-requisite: you already provisioned Docker in your VM.
sudo docker ps -a | grep elk >> /dev/null
if [ $? -eq 0 ]
  then
    echo "Stop and remove elk"
    sudo docker stop elk >> /dev/null
    sudo docker rm elk >> /dev/null
fi

cat /etc/sysctl.conf | grep vm.max_map_count >> /dev/null
if [ $? -ne 0 ]
  then
    echo "Set vm.max_map_count to 262144 in /etc/sysctl.conf"
    echo "vm.max_map_count=262144" >> /etc/sysctl.conf
fi
sudo sysctl -w vm.max_map_count=262144

echo "Install elk"
sudo docker pull sebp/elk
sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -v /vagrant/elk-vol:/etc/logstash/conf.d -it --name elk -d sebp/elk

echo "elk installation complete!"
#                    -v /c/users/marecm/python/vagrant-rabbitmq/logstash.conf:/etc/logstash/conf.d/logstash.conf \