#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Must provide path to discord-bot. For example: ./start-whodis.sh ../whodis'
    exit 1
fi

cd $1
WD=`pwd`
cd -

if [ ! -f "./whodis/docker-compose.override.yml" ]; then
	echo "Discord Bot Token from https://discord.com/developers/applications:"
	read DISCORD_TOKEN
	echo "version: \"3.7\" 
services:
  whodis_api:
    volumes:
      - ${WD}:/app
    environment:
      - DISCORD_TOKEN=${DISCORD_TOKEN}
" > ./whodis/docker-compose.override.yml
fi

bash -c "./dev-env up whodis_api"
