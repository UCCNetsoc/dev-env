#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sudo rm $DIR/freeipa-data.tar.gz
sudo tar -czvf $DIR/freeipa-data.tar.gz ./data/
sudo chown $UID:$UID $DIR/freeipa-data.tar.gz
