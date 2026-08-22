#!/bin/bash

cd ~/Downloads/

curl -J -L "https://cdn.fastly.steamstatic.com/client/installer/steam.deb" --output steam.deb
curl -J -L "https://discord.com/api/download?platform=linux&format=deb" --output discord.deb

