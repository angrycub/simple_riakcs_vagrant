# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/centos-6.5"
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.provision "shell", path: "bin/provision_install_applications.sh"

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1.local"
    node1.vm.network "private_network", ip: "192.168.33.11"
    node1.vm.provision "shell", path: "bin/provision_configure_node.sh", args: ["192.168.33.11"]
    node1.vm.provision "shell", path: "bin/provision_start_services.sh"
    node1.vm.provision "shell", path: "bin/provision_create_admin_user.sh"
    node1.vm.provision "shell", path: "bin/provision_configure_admin_user.sh"
    node1.vm.provision "shell", path: "bin/provision_stop_services.sh"
    node1.vm.provision "shell", path: "bin/provision_start_services.sh"
 end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2.local"
    node2.vm.network "private_network", ip: "192.168.33.12"
    node2.vm.provision "shell", path: "bin/provision_configure_node.sh", args: ["192.168.33.12"]
    node2.vm.provision "shell", path: "bin/provision_configure_admin_user.sh"
    node2.vm.provision "shell", path: "bin/provision_start_services.sh"
    node2.vm.provision "shell", path: "bin/provision_join_node1.sh"
 end

  config.vm.define "node3" do |node3|
    node3.vm.hostname = "node3.local"
    node3.vm.network "private_network", ip: "192.168.33.13"
    node3.vm.provision "shell", path: "bin/provision_configure_node.sh", args: ["192.168.33.13"]
    node3.vm.provision "shell", path: "bin/provision_configure_admin_user.sh"
    node3.vm.provision "shell", path: "bin/provision_start_services.sh"
    node3.vm.provision "shell", path: "bin/provision_join_node1.sh"
    node3.vm.provision "shell", path: "bin/provision_plan_and_commit.sh"
  end
end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

