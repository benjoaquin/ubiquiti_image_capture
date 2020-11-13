#!/bin/bash

## Define constants 
wd=$(pwd) # current directory where the script is 
logs=$wd/logs # the directory where logs should go
destination=$wd/downloads # the directory where files should go
devices=("back_yard" "front_house" "rear_house" "north_side_yard" "south_side_yard") # array of devices that must match array in installer
device_ip=("192.168.1.10" "192.168.1.23" "192.168.1.19" "192.168.1.11" "192.168.1.21")
# devices=("garage" "living_room")
# device_ip=("192.168.0.120" "192.168.0.121")


# This will just run until a crash or you type Ctrl + C
while true; do
	currenttime=$(date +%H:%M)
	if [[ "$currenttime" > "06:00" ]] && [[ "$currenttime" < "18:00" ]] 
	then
		echo "$(date "+%Y-%m-%dT%H.%M.%S") | Attempting to capture images." >> $logs/logs.txt
		for index in "${!devices[@]}";
		do 
	    	device=${devices[$index]}
	    	URL=${device_ip[$index]}
	    	wget --append-output=$logs/logs.txt --output-document=$destination/$device/$device-$(date "+%Y-%m-%dT%H.%M.%S").jpeg --timeout=10 --tries=2 --no-clobber --progress=bar:force:noscroll $URL/snap.jpeg
	    done
	else
		echo "$(date "+%Y-%m-%dT%H.%M.%S") | Skipping capture while outside designated hours" >> $logs/logs.txt
	fi
	sleep 60s
done 