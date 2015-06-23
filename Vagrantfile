# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

FIRST_NODE = "10.202.77.23"

  config.vm.box = "chef/centos-6.5"
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.provision "install_applications", type: "shell", path: "bin/provision_install_applications.sh"

  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1.local"
    node1.vm.network "private_network", ip: "10.202.77.23"
    node1.vm.network "public_network"
    node1.vm.provision "configure_node", type: "shell", path: "bin/provision_configure_node.sh", args: ["10.202.77.23",FIRST_NODE]
    node1.vm.provision "start_services", type: "shell", path: "bin/provision_start_services.sh"
    node1.vm.provision "create_admin_user", type: "shell", path: "bin/provision_create_admin_user.sh"
    node1.vm.provision "configure_admin_user", type: "shell", path: "bin/provision_configure_admin_user.sh"
    node1.vm.provision "stop_services", type: "shell", path: "bin/provision_stop_services.sh"
    node1.vm.provision "start_services2", type: "shell", path: "bin/provision_start_services.sh"
    node1.vm.provision "xip_io", type: "shell", path: "bin/provision_xip_io.sh"
 end

  config.vm.define "node2" do |node2|
    node2.vm.hostname = "node2.local"
    node2.vm.network "private_network", ip: "10.202.77.24"
    node2.vm.provision "configure_node", type: "shell", path: "bin/provision_configure_node.sh", args: ["10.202.77.24",FIRST_NODE]
    node2.vm.provision "configure_admin_user", type: "shell", path: "bin/provision_configure_admin_user.sh"
    node2.vm.provision "start_services", type: "shell", path: "bin/provision_start_services.sh"
    node2.vm.provision "join_node", type: "shell", path: "bin/provision_join_node.sh", args: [FIRST_NODE]
 end

  config.vm.define "node3" do |node3|
    node3.vm.hostname = "node3.local"
    node3.vm.network "private_network", ip: "10.202.77.25"
    node3.vm.provision "configure_node", type: "shell", path: "bin/provision_configure_node.sh", args: ["10.202.77.25",FIRST_NODE]
    node3.vm.provision "configure_admin_user", type: "shell", path: "bin/provision_configure_admin_user.sh"
    node3.vm.provision "start_services", type: "shell", path: "bin/provision_start_services.sh"
    node3.vm.provision "join_node", type: "shell", path: "bin/provision_join_node.sh", args: [FIRST_NODE]
    node3.vm.provision "plan_and_commit", type: "shell", path: "bin/provision_plan_and_commit.sh"
  end
end
