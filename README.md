Vagrant rails.ai service appliance
==================================
# Presentation
This is a Vagrant project that can be used to quickly deploy a trusty64
 ubuntu VM with docker containerized infrastructure services fror rails
 AI:
- [rabbitmq](https://hub.docker.com/_/rabbitmq/) (with management
console)
- [postgres](https://hub.docker.com/_/postgres/) (and
[pgadmin4](https://hub.docker.com/r/dpage/pgadmin4/) client)

For convenience, a container management tool is also provided
([Portainer](https://hub.docker.com/r/portainer/portainer/)).

# Pre-requisiste
- install Oracle Virtual box
- install vagrant

These can be downloaded from rails AI file server (10.62.81.186, under
"Incubation Rail AI") or via the [Rails AI wiki](https://treaty.emc.com/engineering/inc/_layouts/15/start.aspx#/Documents/Forms/AllItems.aspx?RootFolder=%2Fengineering%2Finc%2FDocuments%2F%E2%80%8BRail%20AI%2FInfrastructure%2Finfrastructure%5Fsoftware&FolderCTID=0x0120001DEE9E5C5A970F4099BD0534F3630BFA&View=%7B3C828E24%2D498E%2D4FDA%2D9514%2DE8A54A0793D5%7D)

# Architecture
![infra](/infrastructure.jpg)

# How to use
1) in your hosts file, add:
192.168.33.10	rails.ai.local
2) cd into the root folder of the project and run:
```
    vagrant up
```
this will start the VM, and provision the rabbitmq as a docker service
3) access rabbitmq management console in your browser using the url
rails.ai.local:15672 (guest/guest)
4) stop the VM with
```
vagrant halt
```

# Configuration info
1) rabbitmq
- management UI: port: 15672 : u: guest / p: guest
- rabbit server: port: 5672