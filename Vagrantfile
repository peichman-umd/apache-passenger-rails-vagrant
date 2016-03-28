# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "peichman-umd/ruby"

  config.vm.network "forwarded_port", guest: 80, host: 8000

  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provision "shell", path: "scripts/passenger.sh", privileged: true
  config.vm.provision "shell", path: "scripts/firewall.sh", privileged: true
end
