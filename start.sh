#!/bin/bash -ex
# Start script for Solace Crafting called from docker

# Move steamcmd install to startup
if [ ! -f /app/steamcmd/steamcmd.sh ]
then
	# no steamcmd
	printf "SteamCMD not found, installing\n"
	mkdir /app/steamcmd/
	cd /app/steamcmd/
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xf steamcmd_linux.tar.gz
	rm steamcmd_linux.tar.gz
fi
	

build=${BRANCH}

if [ ${BRANCH} == "public" ]
then
	# GA
	/app/steamcmd/steamcmd.sh +force_install_dir /app +@sSteamCmdForcePlatformType windows +login anonymous +app_update 2089300 +quit
else
	# Expermental 
	/app/steamcmd/steamcmd.sh +force_install_dir /app +@sSteamCmdForcePlatformType windows +login anonymous +app_update 2089300 -beta ${BRANCH} +quit
fi


# Launch Server
rm -f /tmp/.X1-lock
WINEARCH=win64
WINEPREFIX=/app
Xvfb :1 -screen 0 800x600x24 &
export DISPLAY=:1

cd /app
wine  ./Icarus/Binaries/Win64/IcarusServer-Win64-Shipping.exe -Log -UserDir="./Saves" --SteamServerName="${NAME}" -PORT="${GAME_PORT}" -QueryPort="${QUERY_PORT}" ${ADDITIONAL_ARGS}
