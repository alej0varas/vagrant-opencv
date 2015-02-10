# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # basebox
  config.vm.box = "ubuntu/trusty64"

  # install some base packages to get OpenCV up and running
  config.vm.provision :shell, :path => "scripts/base_install.sh"

  # use graphical programs
  config.ssh.forward_x11 = true  
end
