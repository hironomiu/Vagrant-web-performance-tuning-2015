# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-6.6-64-puppet"
  config.vm.hostname = "sunrise2015.local"
  config.vm.network :private_network, ip: "192.168.56.7" 

  config.vm.provider :virtualbox do |vb|
    vb.name = "Sunrise2015"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules":"/vagrant/puppet/roles"' do |puppet|
     puppet.manifests_path = "./puppet/manifests"
     puppet.manifest_file  = "app.pp"
  end

end
