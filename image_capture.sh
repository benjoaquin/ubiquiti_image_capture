#!/bin/bash

## Define constants 
wd=$(pwd) # current directory where the script is 
logs=$wd/logs # the directory where logs should go
destination=$wd/downloads # the directory where files should go
devices=("back_yard" "front_house" "front_yard" "rear_house" "north_side_yard" "south_side_yard") # array of devices that must match array in installer
device_ip=("192.168.1.10" "192.168.1.23" "192.168.1.18" "192.168.1.19" "192.168.1.11" "192.168.1.21")
#device_ip=("https://res-4.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/sdz7aspakybuxp7oojvh.png" "https://www.python.org/static/apple-touch-icon-144x144-precomposed.png" "192.168.1.18" "192.168.1.19" "192.168.1.11" "192.168.1.21")


# This will just run until a crash or you type Ctrl + C
while true; do
	for index in "${!devices[@]}";
	do 
    	device=${devices[$index]}
    	URL=${device_ip[$index]}
    	wget $URL --append-output=$logs/logs.txt --output-document=$destination/$device/$device-$(date "+%Y-%m-%dT%H.%M.%S").png --timeout=10 --tries=2 --no-clobber
	done
	sleep 60s
done