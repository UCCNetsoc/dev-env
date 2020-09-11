#!/bin/bash
sudo rm ./freeipa-data.tar.gz
sudo tar -czvf ./freeipa-data.tar.gz ./data/ ./home/
sudo chown $UID:$UID ./freeipa-data.tar.gz
