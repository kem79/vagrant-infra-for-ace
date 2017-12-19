Vagrant rails.ai service appliance
==================================
# Presentation
This is a Vagrant project that can be used to quickly deploy locally
rabbitmq service.

# Pre-requisiste
- install Oracle Virtual box
- install vagrant

These can be downloaded from rails AI file server (10.62.81.186, under
"Incubation Rail AI")

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