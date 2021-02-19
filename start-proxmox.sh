#!/bin/bash
set -e

if [[ $# -eq 1 ]] ; then
    cp $1/provision-proxmox-templates.yml backing-services/proxmox-ve/playbooks/provision-nac.yml
fi

if [ ! -f "./backing-services/proxmox-ve/cloud-lxc-images/README.md" ]; then
    git pull --recurse-submodules
fi

# check if the packer disk exists
if [ ! -f "./backing-services/proxmox-ve/packer/output-proxmox-ve/packer-proxmox-ve" ]; then
    echo "Building disk..."
    cd ./backing-services/proxmox-ve/packer
    packer build packer.json
    cd ../../..
fi

if [ ! -f "./backing-services/proxmox-ve/disk" ]; then
    rm -f ./backing-services/proxmox-ve/disk ||  rm -ff ./backing-services/proxmox-ve/disk
    echo "Copying disk..."
    cp ./backing-services/proxmox-ve/packer/output-proxmox-ve/packer-proxmox-ve ./backing-services/proxmox-ve/disk
fi

echo "Starting Proxmox"
./dev-env up proxmox 
