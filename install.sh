#!/bin/bash
devices=("back_yard" "front_house" "rear_house" "north_side_yard" "south_side_yard") # array of devices that must match array in image_capture
#devices=("garage" "living_room")

mkdir ./downloads
mkdir ./logs

for device in "${devices[@]}";
do
	mkdir ./downloads/$device
done