#!/bin/bash
# Sample run script.  Primarly used in build / testing

docker rm icarus
docker run -it -p 27015:27015/udp -p 27015:27015 -p 17777:17777/udp -p 17777:17777 -v /app/docker/temp-vol:/app \
-e Name="T3stN3t Test Server" \
-e ADDITIONAL_ARGS="-MaxPlayers=8" \
--name icarus antimodes201/icarus-server:latest