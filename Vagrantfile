Vagrant.configure("2") do |config|
  config.vm.define "ftp" do |ftp|
    ftp.vm.box = "debian/bullseye64"
    ftp.vm.network "private_network", ip: "192.168.76.101"
  end
  config.vm.provision "shell", path: "config/bootstrap.sh"
end
