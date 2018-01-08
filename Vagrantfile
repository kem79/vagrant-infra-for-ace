ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|

  config.vm.define "rails_ai_external_services" do |rails_ai_external_services|
    rails_ai_external_services.vm.box = "ubuntu/trusty64"

    rails_ai_external_services.vm.network "private_network", ip: "192.168.99.100"

    rails_ai_external_services.vm.provision :shell, path: "docker_install.sh", name: "docker"
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


