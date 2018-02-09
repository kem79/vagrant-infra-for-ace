Vagrant rails.ai service appliance
==================================
# Presentation
This is a Vagrant project that can be used to quickly deploy a trusty64
 ubuntu VM with docker containerized infrastructure services for rails
 AI:
- [rabbitmq](https://hub.docker.com/_/rabbitmq/) (with management
console)
- [postgres](https://hub.docker.com/_/postgres/) (and
[pgadmin4](https://hub.docker.com/r/dpage/pgadmin4/) client)
- [ELK](https://www.elastic.co/)

For convenience, a container management tool is also provided
([Portainer](https://hub.docker.com/r/portainer/portainer/)).

# Pre-requisiste
- install Oracle Virtual box
- install vagrant

These can be downloaded from rails AI file server (10.62.81.186, under
"Incubation Rail AI") or via the [Rails AI wiki](https://treaty.emc.com/engineering/inc/_layouts/15/start.aspx#/Documents/Forms/AllItems.aspx?RootFolder=%2Fengineering%2Finc%2FDocuments%2F%E2%80%8BRail%20AI%2FInfrastructure%2Finfrastructure%5Fsoftware&FolderCTID=0x0120001DEE9E5C5A970F4099BD0534F3630BFA&View=%7B3C828E24%2D498E%2D4FDA%2D9514%2DE8A54A0793D5%7D)

# Architecture (THIS IS OUTDATED)
![infra](infrastructure.jpg)

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
    sudo docker start rabbitmq pg pga4 portainer
    ```
## After initial start
You can suspend/resume the vm, in which case the docker services will keep their status persisted 
by vagrant and you won't have to start them by hand using docker start command
1. suspend the VM
    ```aidl
    vagrant suspend
    ```
2. to resume the VM:
    ```aidl
    vagrant resume
    ```
# Configuration info
- rabbitmq
  - to access rabbit management GUI: 192.168.99.100:15672 (u: guest / p: guest)
  - rabbit server: 192.168.99.100:5672
- postgres
  - to access pgadim4 management GUI: 192.168.99.100:9090 (u: guest/ p: guest)
    - to connect to postgres server in GUI, use postgres docker network
    configuration: IP: 192.168.0.2 port: 5432
  - to access postgres directly: 192.168.99.100:5432
- portainer
  - to access to portainer management GUI: 192.168.99.100:9000
- elk
  - elastic search entry is on port 9200
  - logstash sink port is 5000
  - kibana UI is accessible on port 5601
  - beat is running on port 5044

  
# How to connect the service to PCF
1) for postgres, use connection string like "postgres://guest:guest@192.168.99.100:5432/guest" when you
define a user custom service in PCF
![infra](postgres_credential.jpg)
2) To sink PCF micro-services logs to logstash (ELK), bind the service to a custom user defined 
service using "syslog://192.168.99.100:5000"