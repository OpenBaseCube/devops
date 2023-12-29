Vagrant.configure("2") do |config|
    config.vm.define "amaster" do |amaster|
      amaster.vm.box_download_insecure = true
      amaster.vm.box = "hashicorp/bionic64"
      amaster.vm.network "forwarded_port", guest: 8080, host: 8080
      amaster.vm.network "forwarded_port", guest: 8081, host: 8081
      amaster.vm.network "private_network", ip: "100.0.0.1"
      amaster.vm.hostname = "amaster"
      amaster.vm.provider "virtualbox" do |v|
        v.name = "amaster"
        v.memory = 2048
        v.cpus = 2
      end
    end
  
    config.vm.define "k8smaster" do |k8smaster|
      k8smaster.vm.box_download_insecure = true
      k8smaster.vm.box = "hashicorp/bionic64"
      k8smaster.vm.network "private_network", ip: "100.0.0.2"
      k8smaster.vm.hostname = "k8smaster"
      k8smaster.vm.provider "virtualbox" do |v|
        v.name = "k8smaster"
        v.memory = 2048
        v.cpus = 2
      end
    end
  
  
    config.vm.define "k8sworker" do |k8sworker|
      k8sworker.vm.box_download_insecure = true
      k8sworker.vm.box = "hashicorp/bionic64"
      k8sworker.vm.network "private_network", ip: "100.0.0.3"
      k8sworker.vm.hostname = "k8sworker"
      k8sworker.vm.provider "virtualbox" do |v|
        v.name = "k8sworker"
        v.memory = 2048
        v.cpus = 2
      end
    end
  `
  end
  