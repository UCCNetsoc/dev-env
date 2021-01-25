#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Must provide path to discord-bot. For example: ./start-discord-bot.sh ../discord-bot'
    exit 1
fi

cd $1
WD=`pwd`
cd -

if [ ! -f "./discord-bot/docker-compose.override.yml" ]; then
    echo "Discord Bot Token from https://discord.com/developers/applications:" 
    read DISCORD
    echo "Public Server ID (Turn on Discord Developer Mode and right click to get ID):"
    read PUBLIC_SERVER
    echo "Committee Server ID:"
    read COMMITTEE_SERVER
    echo "Public Announcements Channel ID:"
    read PUBLIC_CHANNEL
    echo "Public General Channel ID:"
    read PUBLIC_GENERAL
    echo "Private Events Channel ID:"
    read COMMITTEE_CHANNEL
    echo "Welcome Messages (comma delimited, username as %s):"
    read WELCOME_MESSAGES
    echo "Sendgrid Token (optional, press enter if none)"
    read SENDGRID

	echo "version: \"3.7\" 
services:
  discord-bot:
    environment:
      - DISCORD_TOKEN=${DISCORD}
      - DISCORD_PUBLIC_SERVER=${PUBLIC_SERVER}
      - DISCORD_PUBLIC_CHANNEL=${PUBLIC_CHANNEL}
      - DISCORD_PUBLIC_GENERAL=${PUBLIC_GENERAL}
      - DISCORD_COMMITTEE_SERVER=${COMMITTEE_SERVER}
      - DISCORD_COMMITTEE_CHANNEL=${COMMITTEE_CHANNEL}
      - DISCORD_PUBLIC_WELCOME=${WELCOME_MESSAGES}
      - DISCORD_PUBLIC_CORONA=${PUBLIC_GENERAL}
      - SENDGRID_TOKEN=${SENDGRID}
    volumes:
      - ${WD}:/bot
" > ./discord-bot/docker-compose.override.yml
fi

bash -c "./dev-env up discord-bot"
