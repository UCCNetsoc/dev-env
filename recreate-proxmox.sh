#!/bin/bash

rm -rf ./backing-services/proxmox-ve/packer/output-proxmox-ve
rm -f ./backing-services/proxmox-ve/disk
./start-proxmox.sh