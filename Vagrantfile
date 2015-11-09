# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.1"
  config.vm.hostname = "plain-centos7"

  config.vm.network "forwarded_port", guest: 22, host: 11222, id:"ssh"
  config.vm.network "forwarded_port", guest: 8080, host: 11280, id:"http"
  config.vm.network "private_network", ip: "192.168.33.12"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 60000]
  end
end
