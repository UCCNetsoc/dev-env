#!/bin/bash
if [ ! -d "./proxmox-ve" ]; then
    vagrant plugin install vagrant-disksize
    git clone https://github.com/rgl/proxmox-ve.git
    cp proxmox-ve.json proxmox-ve
    cd proxmox-ve
    make build-virtualbox
    cd example
    sed -i "s/proxmox-ve-amd64/..\/proxmox-ve-amd64-virtualbox.box/g" ./Vagrantfile
    sed -n -i 'p;5a \  config.disksize.size = "50GB"' ./Vagrantfile
else
    cd proxmox-ve/example
fi

vagrant up --provider=virtualbox
