#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
sudo tar --same-owner -xvf $DIR/freeipa-data.tar.gz -C $DIR
