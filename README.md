# Overview
Tools for capturing images from Ubiquiti brand cameras on a Mac with Bourne Again Shell (bash) 3.2 or higher.

# Getting Started

### Configure youer camera(s)
For this to work, your device(s) need to be configured to allow anyone with network access to grab images. Obviously don't do this if you aren't comfortable with the security implications of this.

1. Sign into Protect UI:
https://protect.ui.com/
* Select your NVR
* On the left bottom corner click Settings (the gear icon)
* Click Advanced
* On the right side click REVEAL to see the Device password (it's complex)
* Copy the password
* Connect to the Camera via https:
https://your.camera.ip.address
* Log in:
user name: ubnt
password: [copied complex password from above]
* Under CONFIGURE, check "Enable Anonymous Snapshot”
* Click SAVE CHANGES

To test, point your browser at: `http://your.camera.ip.address/snap.jpeg`.

### Downloading

1. Download this repo by clicking the green "Code" button in the upper right corner of the repos webpage on GitHub and selecting "Download Zip".
* Unzip the file in a directory where you'd like content to exits.
* Open your terminal and set your working directory to the script directory with `cd ~/path/to/directory`.
  * From the Finder, right click on the directory and hold Option to reveal `Copy "your_directory" as Pathname`. 
* Run `bash install.sh` to create necessary sub-directories.

### Running
1. From the script directory run `nohup bash image_capture.sh`
  * `nohup` allows you to close your terminal session without impacting the process.
* To ensure your system doesn't sleep while the script is running, follow execution with the command `caffeinate -w PID`. See section on "Stopping" to get your PID. 

# Stopping
1. Find the process id with `ps -ax | grep image_capture.sh` and you'll see something like this: `5226 ??         0:00.03 bash image_capture.sh`. That first number `5226` is your PID.
2. Kill the process with `kill -9 5226`