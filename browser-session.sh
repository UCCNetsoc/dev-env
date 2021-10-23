#!/bin/sh
if command -v chromium &> /dev/null
then
	chromium --proxy-server="socks5://localhost:1080" --incognito --user-data-dir=/tmp --no-first-run
else 
	google-chrome-stable --proxy-server="socks5://localhost:1080" --incognito --user-data-dir=/tmp --no-first-run
fi
