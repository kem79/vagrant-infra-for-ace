ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|


  config.vm.define "rails_ai_external_services" do |rails_ai_external_services|
    rails_ai_external_services.vm.box = "ubuntu/trusty64"

    rails_ai_external_services.vm.network "private_network", ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 5672, host: 5672, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 15672, host: 15672, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 1883, host: 1883, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 6379, host: 6379, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "192.168.99.100"
    rails_ai_external_services.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "192.168.99.100"

    rails_ai_external_services.vm.provision "docker", type: :shell, path: "docker_install.sh"
    rails_ai_external_services.vm.provision "redis", type: :shell, path: "redis_install.sh"
    rails_ai_external_services.vm.provision "redis-cli", type: :shell, path: "redis_cli.sh"
    rails_ai_external_services.vm.provision "rabbitmq", type: :shell, path: "rabbitmq_install.sh"
    # rails_ai_external_services.vm.provision "mysql", type: :shell, path: "mysql_install.sh"
    rails_ai_external_services.vm.provision "postgres", type: :shell, path: "postgres_install.sh"
    rails_ai_external_services.vm.provision "mongo", type: :shell, path: "mongodb_install.sh"
    # rails_ai_external_services.vm.provision "pgadmin4", type: :shell, path: "pgadmin4_install.sh"
    # rails_ai_external_services.vm.provision "elk", type: :shell, path: "elk_install.sh"
    rails_ai_external_services.vm.provision "portainer", type: :shell, path: "portainer_install.sh"

    rails_ai_external_services.vm.provider "virtualbox" do |vbox|
      vbox.memory = 4096
      vbox.cpus = 1
    end



  end

end


