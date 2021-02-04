#!/bin/bash
set -e

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
    rm -f ./backing-services/proxmox-ve/disk
    echo "Copying disk..."
    cp ./backing-services/proxmox-ve/packer/output-proxmox-ve/packer-proxmox-ve ./backing-services/proxmox-ve/disk
fi

echo "Starting Proxmox"
./dev-env up proxmox 
