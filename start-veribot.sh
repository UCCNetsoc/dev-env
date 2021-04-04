#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Must provide path to discord-bot. For example: ./start-veribot.sh ../veribot'
    exit 1
fi

cd $1
WD=`pwd`
cd -

if [ ! -f "./veribot/docker-compose.override.yml" ]; then
    echo "Discord Bot Token from https://discord.com/developers/applications:" 
    read DISCORD

	echo "version: \"3.7\" 
services:
  veribot_api:
    volumes:
      - ${WD}:/app
    environment:
      - DISCORD_TOKEN=${DISCORD}
" > ./veribot/docker-compose.override.yml
fi

bash -c "./dev-env up veribot_api"
