#!/bin/bash

rm -rf ./backing-services/proxmox-ve/packer/output-proxmox-ve
rm -f ./backing-services/proxmox-ve/disk
./dev-env down
./start-proxmox.sh ${@:1}
