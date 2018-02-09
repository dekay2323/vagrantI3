# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "base"
    config.vm.box = "ubuntu/trusty64"
    config.vm.synced_folder ".", "/vagrant"
    config.vm.provision :shell, :path => "provision.sh"
    config.vm.provision :shell, :path => "provision-dev.sh"
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = true
        # Customize the amount of memory on the VM:
        vb.memory = "8129"
        vb.cpus = "8"
        # Enable sound support
        # (available options for audiocontroller: "hda" for Linux host, "sb16", "ac97" for Windows host)
        # (available options for audio: "alsa" or "pulse" for Linux host, "dsound" for Windows host, "coreaudio" for Mac OS)
        # vb.customize ["modifyvm", :id, '--audio', 'alsa', '--audiocontroller', 'hda']
    end
    config.vm.provision :shell, :inline => "apt-get install -y virtualbox-guest-x11 && reboot"
end
