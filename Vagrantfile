VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"
  # Omnibus
  config.omnibus.chef_version = :latest
  # php4
  config.vm.define "php4" do | php4|
    php4.vm.network :private_network, ip: "192.168.33.10"
    php4.vm.network :forwarded_port, guest: 80, host: 8080
    php4.vm.hostname = "php4.local"
  end
end
