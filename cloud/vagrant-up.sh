#!/bin/bash
if [ ! -d "./proxmox-ve" ]; then
    vagrant plugin install vagrant-libvirt
    git clone https://github.com/rgl/proxmox-ve.git
    cp proxmox-ve.json proxmox-ve
    cd proxmox-ve
    make build-virtualbox
    cd example
    sed -i "s/proxmox-ve-amd64/..\/proxmox-ve-amd64-virtualbox.box/g" ./Vagrantfile
else
    cd proxmox-ve/example
fi

vagrant up --provider=virtualbox
