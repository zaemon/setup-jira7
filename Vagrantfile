# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "jira7"

  config.vm.network "forwarded_port", guest: 22, host: 11222, id:"ssh"
  config.vm.network "forwarded_port", guest: 8080, host: 11380, id:"http"
  config.vm.network "private_network", ip: "192.168.33.13"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 60000]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.limit = 'all'
    ansible.inventory_path = "hosts"
    ansible.playbook = "jira7.yml"
  end

end
