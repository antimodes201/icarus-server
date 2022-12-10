# solace-crafting-server
Docker Container for Icarus Dedicated Server

Build to create a containerized version of the dedicated server for Icarus
https://store.steampowered.com/app/1149460/ICARUS/
 
 
Build by hand
```
git clone https://github.com/antimodes201/icarus-server.git
docker build -t antimodes201/icarus-server:latest .
``` 
 
Docker Pull
```
docker pull antimodes201/icarus-server
```
 
Docker Run with defaults 
change the volume options to a directory on your node
 
```
docker run -it -p 27015:27015/udp -p 27015:27015 -p 17777:17777/udp -p 17777:17777 -v /app/docker/temp-vol:/app \
-e Name="T3stN3t Test Server" \
--name icarus antimodes201/icarus-server:latest
```
 
You will need to run the server once and then stop it in order to create the default config files.  These are found in Icarus\Saves. Edit this to your requirements and restart the container.
  
If you would like to run an expirmental beta version use the build environmental setting
 
```
docker run -it -p 27015:27015/udp -p 27015:27015 -p 17777:17777/udp -p 17777:17777 -v /app/docker/temp-vol:/app \
-e Name="T3stN3t Test Server" \
-e BUILD="expirmental" \
--name icarus antimodes201/icarus-server:latest
```
 
If you would like to set additional launch paramaters use the ADDITIONAL_ARG environmental variable.  For example to change the Max Players to 8 from the default of 4:
 
```
docker run -it -p 27015:27015/udp -p 27015:27015 -p 17777:17777/udp -p 17777:17777 -v /app/docker/temp-vol:/app \
-e Name="T3stN3t Test Server" \
-e ADDITIONAL_ARGS="-MaxPlayers=8" \
-e BUILD="expirmental" \
--name icarus antimodes201/icarus-server:latest
```
 

For additional details on configuring the server please see https://github.com/RocketWerkz/IcarusDedicatedServer/wiki/Server-Config-&-Launch-Parameters
 
Currently exposed environmental variables and their default values
- BUILD default
- GAME_PORT 17777
- QUERY_PORT 27015
- TZ America/New_York
 
For additional information join us on Discord: https://discord.gg/QFFRxyT

#HappyGaming
