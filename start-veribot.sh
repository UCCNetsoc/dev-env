#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Must provide path to discord-bot. For example: ./start-veribot.sh ../veribot'
    exit 1
fi

cd $1
WD=`pwd`
cd -

if [ ! -f "./veribot/docker-compose.override.yml" ]; then
	echo "version: \"3.7\" 
services:
  veribot_api:
    volumes:
      - ${WD}:/app
" > ./veribot/docker-compose.override.yml
fi

bash -c "./dev-env up veribot_api"
