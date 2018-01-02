ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|

  config.vm.define "rails_ai_external_services" do |rails_ai_external_services|
    rails_ai_external_services.vm.box = "ubuntu/trusty64"

    rails_ai_external_services.vm.network "private_network", ip: "192.168.33.10"
    # rabbitmq
    rails_ai_external_services.vm.network "forwarded_port", guest: 15672, host: 15672
    rails_ai_external_services.vm.network "forwarded_port", guest: 5672, host: 5672
    rails_ai_external_services.vm.network "forwarded_port", guest: 1883, host: 1883
    # postgres
    rails_ai_external_services.vm.network "forwarded_port", guest: 5432, host: 5432
    # pgadmin
    rails_ai_external_services.vm.network "forwarded_port", guest: 80, host: 80
    # portainer
    rails_ai_external_services.vm.network "forwarded_port", guest: 9000, host: 9000


    rails_ai_external_services.vm.provision :shell, path: "docker_install.sh", name: "docker"
    rails_ai_external_services.vm.provision :shell, path: "docker_network_install.sh", name: "network"
    rails_ai_external_services.vm.provision :shell, path: "rabbitmq_install.sh", name: "rabbitmq"
    rails_ai_external_services.vm.provision :shell, path: "postgres_install.sh", name: "postgres"
    rails_ai_external_services.vm.provision :shell, path: "pgadmin4_install.sh", name: "pgadmin4"
    rails_ai_external_services.vm.provision :shell, path: "portainer_install.sh", name: "portainer"

    rails_ai_external_services.vm.provider "virtualbox" do |vbox|
      vbox.memory = 1024
      vbox.cpus = 1
    end

  end

end


