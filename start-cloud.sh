#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Must provide path to cloud. For example: ./start-cloud.sh ../cloud'
    exit 1
fi

DEVENV_DIR=`pwd`
CLOUD_DIR=$(readlink -f $1)

cd $CLOUD_DIR
if [ ! -d "./bin" ]; then
	virtualenv -p /usr/bin/python3 .
	source bin/activate
	pip3 install -r ./requirements.txt
	cd $CLOUD_DIR/ui
	npm install
	cd $CLOUD_DIR
fi

cd $DEVENV_DIR
./dev-env stop ipa
$DEVENV_DIR/backing-services/freeipa/freeipa-delete-data.sh
$DEVENV_DIR/backing-services/freeipa/freeipa-decompress-data.sh
./dev-env start ipa

echo "version: \"3.7\"
services:
  cloud:
    volumes:
      - ${CLOUD_DIR}/ui:/app
  api:
    volumes:
      - ${CLOUD_DIR}/api:/app
      - ${CLOUD_DIR}/api/requirements.txt:/requirements.txt
      - ${CLOUD_DIR}/config.sample.yml:/config.yml
" > ./cloud/docker-compose.override.yml

bash --init-file <(echo "source ${CLOUD_DIR}/bin/activate") -c "./dev-env up cloud api && cd ${CLOUD_DIR}"