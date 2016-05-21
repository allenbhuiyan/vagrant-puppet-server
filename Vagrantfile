# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "puppet.local.vagrant"
    master.vm.provision :shell, path: "master/bootstrap.sh"
    master.vm.network "private_network", ip: "10.1.2.10",
      virtualbox__intnet: "PuppetNet"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      vb.memory = "1024"
    end
  end

end
