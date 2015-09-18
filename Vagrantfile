Vagrant.configure(2) do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "4096",
      "--cpus", "4"
    ]
  end

  config.vm.define "centos6" do |c|
    c.vm.hostname = "centos6"
    c.vm.box = "opscode_centos-6.5"
    c.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
    c.vm.provision "shell", inline: "sudo su"
    c.vm.provision "shell", inline: "yum -y update"
    c.vm.provision "shell", inline: "yum groupinstall -y development"
    c.vm.provision "shell", inline: "yum -y install fakeroot mysql mysql-devel postgresql-devel lm_sensors-devel cmake screen"
    c.vm.provision "shell", path: "build_agent.sh"
  end


  config.vm.define "ubuntu14" do |c|
    c.vm.hostname = "ubuntu14"
    c.vm.box = "opscode_ubuntu-14.04"
    c.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    c.vm.provision "shell", inline: "sudo su"
    c.vm.provision "shell", inline: "apt-get update"
    c.vm.provision "shell", inline: "apt-get install -y build-essential"
    c.vm.provision "shell", inline: "apt-get install -y gnupg2"
    c.vm.provision "shell", inline: "apt-get install -y curl"
    c.vm.provision "shell", inline: "apt-get install -y git"
    c.vm.provision "shell", inline: "apt-get install -y cmake mysql-client libmysqlclient-dev postgresql-server-dev-all lm-sensors flex libgmp-dev"
    c.vm.provision "shell", path: "build_agent.sh"

  end

end