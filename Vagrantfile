# -*- mode: ruby -*-
# vi: set ft=ruby :

vm_name = "devbox"
vm_cpus = "4"
vm_mem  = "12288"

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
  config.vm.box = "ubuntu/focal64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "#{Dir.home}/Source", "/home/vagrant/Source"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
 
    # Customize the amount of memory on the VM:
    vb.name = "#{vm_name}"
    # vb.gui = false
    # Copied from https://github.com/IBM/deploy-ibm-cloud-private/blob/master/Vagrantfile
      vb.customize ["modifyvm", :id, "--apic", "on"] # turn on I/O APIC
      vb.customize ["modifyvm", :id, "--ioapic", "on"] # turn on I/O APIC
      vb.customize ["modifyvm", :id, "--x2apic", "on"] # turn on I/O APIC
      vb.customize ["modifyvm", :id, "--biosapic", "x2apic"] # turn on I/O APIC
      vb.customize ["modifyvm", :id, "--cpus", "#{vm_cpus}"] # set number of vcpus
      vb.customize ["modifyvm", :id, "--memory", "#{vm_mem}"] # set amount of memory allocated vm memory
      vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"] # set guest OS type
      # vb.customize ["modifyvm", :id, "--natdnspassdomain", "off" ] # enables use of network dns domain to resolve host
      # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"] # enables DNS resolution from guest using host's DNS
      # vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"] # enables DNS requests to be proxied via the host
      # vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"] # turn on promiscuous mode on nic 2
      # vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
      # vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
      vb.customize ["modifyvm", :id, "--pae", "on"] # enables PAE
      vb.customize ["modifyvm", :id, "--longmode", "on"] # enables long mode (64 bit mode in GUEST OS)
      vb.customize ["modifyvm", :id, "--hpet", "on"] # enables a High Precision Event Timer (HPET)
      vb.customize ["modifyvm", :id, "--hwvirtex", "on"] # turn on host hardware virtualization extensions (VT-x|AMD-V)
      vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"] # Allow nested hw virt
      vb.customize ["modifyvm", :id, "--nestedpaging", "on"] # if --hwvirtex is on, this enables nested paging
      vb.customize ["modifyvm", :id, "--largepages", "on"] # if --hwvirtex & --nestedpaging are on
      vb.customize ["modifyvm", :id, "--vtxvpid", "on"] # if --hwvirtex on
      vb.customize ["modifyvm", :id, "--vtxux", "on"] # if --vtux on (Intel VT-x only) enables unrestricted guest mode
      vb.customize ["modifyvm", :id, "--boot1", "disk"] # tells vm to boot from disk only
      vb.customize ["modifyvm", :id, "--rtcuseutc", "on"] # lets the real-time clock (RTC) operate in UTC time
      # vb.customize ["modifyvm", :id, "--audio", "none"] # turn audio off
      # vb.customize ["modifyvm", :id, "--clipboard", "disabled"] # disable clipboard
      # vb.customize ["modifyvm", :id, "--usbehci", "off"] # disable usb hot-plug drivers
      vb.customize ["modifyvm", :id, "--vrde", "off"]
      vb.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0] # turns the timesync on
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000] # sync time every 10 seconds
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100] # adjustments if drift > 100 ms
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1] # sync time on restore
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1] # sync time on start
      vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000] # at 1 second drift, the time will be set and not "smoothly" adjusted
      # vb.customize ['modifyvm', :id, '--cableconnected1', 'on'] # fix for https://github.com/mitchellh/vagrant/issues/7648
      # vb.customize ['modifyvm', :id, '--cableconnected2', 'on'] # fix for https://github.com/mitchellh/vagrant/issues/7648
      # vb.customize ['storagectl', :id, '--name', 'SATA Controller', '--hostiocache', 'on'] # use host I/O cache
      # vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 0, '--device', 0, '--type', 'hdd', '--nonrotational', 'on', '--medium', "#{base_storage_disk_path}"]
      # if !File.exists?("#{extra_storage_disk_path}")
      #   vb.customize ['createhd', '--filename', "#{extra_storage_disk_path}", '--format', 'VMDK', '--size', 500 * 1024]
      # end
      # if !File.exists?("#{lxd_storage_disk_path}")
      #   vb.customize ['createhd', '--filename', "#{lxd_storage_disk_path}", '--format', 'VMDK', '--size', 500 * 1024]
      # end
      # vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--nonrotational', 'on', '--medium', "#{extra_storage_disk_path}"]
      # vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--nonrotational', 'on', '--medium', "#{lxd_storage_disk_path}"]

  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update >/dev/null
    # Do your requirements for tools below here. Here is just a couple of variants. It starts with a test and is followed by the installation of the tool. 
    # Tests usually output to stdout and/or stderr which is thrown away. Installation output is to stdout/stderr if failed.
    which cmake >/dev/null 2>&1 || apt-get install -y apache2 python3-pip libgmp-dev xubuntu-desktop^ openjdk-17-jdk maven virtualbox cmake net-tools qnetstatview gnupg 
    which vagrant >/dev/null 2>&1|| $(curl -sL https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb >  ./vagrant_2.2.9_x86_64.deb && apt-get install -y ./vagrant_2.2.9_x86_64.deb >/dev/null && rm ./vagrant_2.2.9_x86_64.deb)
    which az >/dev/null 2>&1|| curl -sL https://aka.ms/InstallAzureCLIDeb | bash
    docker --version >/dev/null 2>&1|| apt-get install -y docker.io && sudo usermod -a -G docker vagrant
    docker-compose --version >/dev/null 2>&1|| apt-get install -y docker-compose
    scons --version >/dev/null 2>&1|| pip install scons
    apt-get upgrade -y && reboot
  SHELL
end
