ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|

  config.vm.define "rabbitmq" do |rabbitmq|
    rabbitmq.vm.box = "ubuntu/trusty64"

    rabbitmq.vm.network "private_network", ip: "192.168.33.10"
    rabbitmq.vm.network "forwarded_port", guest: 15672, host: 15672
    rabbitmq.vm.network "forwarded_port", guest: 5672, host: 5672
    rabbitmq.vm.network "forwarded_port", guest: 1883, host: 1883


    rabbitmq.vm.provision :shell, path: "docker_install.sh", name: "docker"
    rabbitmq.vm.provision :shell, path: "rabbitmq_install.sh", name: "Rabbitmq"

    rabbitmq.vm.provider "virtualbox" do |vbox|
      vbox.memory = 1024
      vbox.cpus = 1
    end

  end

end


