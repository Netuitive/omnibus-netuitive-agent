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
    c.vm.box = "bento/centos-6.7"
    c.vm.provision "shell", inline: "sudo su"
    c.vm.provision "shell", inline: "yum -y update"
    c.vm.provision "shell", inline: "yum groupinstall -y development"
    c.vm.provision "shell", inline: "yum -y install fakeroot mysql mysql-devel postgresql-devel lm_sensors-devel cmake screen"
    c.vm.provision "shell", path: "build_agent.sh"
  end


  config.vm.define "ubuntu14" do |c|
    c.vm.hostname = "ubuntu14"
    c.vm.box = "bento/ubuntu-14.04"
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