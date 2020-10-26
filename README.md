# Overview
Methods for capturing images from Ubiquiti brand cameras

# Setup
1. Download this repo to a directory
* Open your terminal and set your working directory to the script directory with `cd ~/path/to/directory`
* Run `bash install.sh` to create necessary sub directories

# Running
1. From the script directory run `nohup bash image_capture.sh`
  * The `nohup` modifier allows you to close your terminal session without impacting the process

# Stopping
1. Find the process id with `ps -ax | grep image_capture.sh` and you'll see something like this: `5226 ??         0:00.03 bash image_capture.sh`. That first number `5226` is your PID.
2. Kill the process with `kill -9 5226`