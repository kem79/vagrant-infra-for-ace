Vagrant rails.ai service appliance
==================================
# Presentation
This is a Vagrant project to quickly deploy a trusty64
 ubuntu VM with docker containerized infrastructure services for ACE:
- [rabbitmq](https://hub.docker.com/_/rabbitmq/) (with management
console)
- [postgres](https://hub.docker.com/_/postgres/)
- [pgadmin4](https://hub.docker.com/r/dpage/pgadmin4/)
- [ELK](https://www.elastic.co/)
- [Redis](https://redis.io/)
- [MongoDB](https://www.mongodb.com/)


For convenience, a container management tool is also provided
([Portainer](https://hub.docker.com/r/portainer/portainer/)), also dockerized.

# Pre-requisiste
- install [Oracle Virtual box] (https://www.virtualbox.org/)
- install [vagrant] (https://www.vagrantup.com/)

If you already have docker installed on your machine, you won't be able to install
vagrant as they have conflicting configuration.

# Architecture (THIS IS OUTDATED)
![](http://10.62.81.24/Marc/rails-ai-service-appliance/images/infrastructure.jpg)

# How to use
## Initial start
1. ensure that IP 192.168.99.100 is available on your local machine.
2. cd into the root folder of the project and run:
    ```
        vagrant up
    ```
    this will start the VM, and provision docker services.
3. stop the VM with
    ```
        vagrant halt
    ```

4. start the services again after a stop
    ```
        vagrant up
        vagrant ssh
        sudo docker start rabbitmq pg pga4 mongo portainer
    ```
## After initial start
You can suspend/resume the VM, in which case the docker services will keep their status persisted 
by Vagrant and you won't have to start them by hand using docker start command
1. suspend the VM
    ```
        vagrant suspend
    ```
2. to resume the VM:
    ```
        vagrant resume
    ```
# Configuration info
## rabbitmq
  - to access rabbit management GUI: 192.168.99.100:15672 (u: guest / p: guest)
  - uri: pyamqp://guest@192.168.99.100//
  
## Postgres
  - to access pgadim4 management GUI: 192.168.99.100:9090 (u: guest/ p: guest)
    - to connect to postgres server in GUI, use postgres docker network
    configuration: IP: 192.168.0.2 port: 5432
  - to access postgres directly: 192.168.99.100:5432
  
## Portainer
  - to access to portainer management GUI: 192.168.99.100:9000
  
## ELK
  - elastic search entry is on port 9200
  - logstash sink port is 5000
  - kibana UI is accessible on port 5601
  - beat is running on port 5044
  
## Redis
  - uri: redis://192.168.99.100
  - redis-cli is installed and can be used to interact with redis
  
## MongoDB
  - uri: mongodb://admin:secret@192.168.99.100:27017/admin
 
# Syslog and PCF
- To sink PCF micro-services logs to logstash (ELK), bind the service to a custom user defined 
service using "syslog://192.168.99.100:5000"