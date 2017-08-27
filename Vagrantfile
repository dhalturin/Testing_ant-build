# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<EOF
yum install -y git unzip ant 2> /dev/null && echo OK || echo FAIL
sudo ssh-keygen -q -N '' <<< ''
sudo cat ~/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo cat > ~/.ssh/config <<E
Host 127.0.0.1
    User vagrant
    Port 22
    UserKnownHostsFile=/dev/null
    StrictHostKeychecking=no
E
chmod +x obf-file.sh
sudo ant -Ddebug_build=true -Dpull_repo=true -Dcompress_level=9
EOF

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provision "file", source: "build.xml", destination: "build.xml"
  config.vm.provision "file", source: "obf-file.sh", destination: "obf-file.sh"
  config.vm.provision "shell", inline: $script
  config.vbguest.auto_update = false
end
