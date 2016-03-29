# -*- mode: ruby -*-
# vi: set ft=ruby :

have_app = ENV["RAILSAPP_DIR"] && Dir.exist?(ENV["RAILSAPP_DIR"])

Vagrant.configure(2) do |config|

  config.vm.box = "peichman-umd/ruby"

  config.vm.network "forwarded_port", guest: 80, host: 8000

  # config.vm.network "private_network", ip: "192.168.33.10"

  if have_app
    config.vm.synced_folder ENV["RAILSAPP_DIR"], "/apps/src"
  end

  config.vm.provision "shell", path: "scripts/passenger.sh", privileged: true
  config.vm.provision "shell", path: "scripts/firewall.sh", privileged: true
  if have_app
    config.vm.provision "shell", path: "scripts/railsapp.sh", privileged: false
  end
end
