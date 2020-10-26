#!/bin/bash

## Define constants 
wd=$(pwd) # current directory where the script is 
logs=$wd/logs # the directory where logs should go
destination=$wd/downloads # the directory where files should go
#devices=("back_yard" "front_house" "front_yard" "rear_house" "north_side_yard" "south_side_yard") # array of devices that must match array in installer
devices=("garage" "living_room")
#device_ip=("192.168.1.10" "192.168.1.23" "192.168.1.18" "192.168.1.19" "192.168.1.11" "192.168.1.21")
device_ip=("192.168.0.120" "192.168.0.121")


# This will just run until a crash or you type Ctrl + C
while true; do
	for index in "${!devices[@]}";
	do 
    	device=${devices[$index]}
    	URL=${device_ip[$index]}
    	wget $URL/snap.jpeg --append-output=$logs/logs.txt --output-document=$destination/$device/$device-$(date "+%Y-%m-%dT%H.%M.%S").png --timeout=10 --tries=2 --no-clobber
	done
	sleep 60s
done