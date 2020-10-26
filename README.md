# Overview
Tools for capturing images from Ubiquiti brand cameras on a Mac with Bourne Again Shell (bash) 3.2 or higher.

# Getting Started

### Configure youer camera(s)
For this to work, your device(s) need to be configured to allow anyone with network access to grab images. Obviously don't do this if you aren't comfortable with the security implications of this.

1. Sign into Protect UI: https://protect.ui.com/
1. Select your NVR
1. On the left bottom corner click Settings (the gear icon)
1. Click Advanced
1. On the right side click REVEAL to see the Device password (it's complex)
1. Copy the password
1. Connect to the Camera via https:https://your.camera.ip.address
1. Log in with `user name: ubnt` and `password: [copied complex password from above]`
1. Under CONFIGURE, check "Enable Anonymous Snapshot”
1. Click SAVE CHANGES

To test, point your browser at: `http://your.camera.ip.address/snap.jpeg`.

### Downloading

1. Download this repo by clicking the green "Code" button in the upper right corner of the repos webpage on GitHub and selecting "Download Zip".
1. Unzip the file in a directory where you'd like content to exits.
1. Open your terminal and set your working directory to the script directory with `cd ~/path/to/directory`.
  1. From the Finder, right click on the directory and hold Option to reveal `Copy "your_directory" as Pathname`. 
1. Run `bash install.sh` to create necessary sub-directories.

### Running
1. From the script directory run `nohup bash image_capture.sh`
  1. `nohup` allows you to close your terminal session without impacting the process.
1. To ensure your system doesn't sleep while the script is running, follow execution with the command `caffeinate -w PID`. See section on "Stopping" to get your PID. 

# Stopping
1. Find the process id with `ps -ax | grep image_capture.sh` and you'll see something like this: `5226 ??         0:00.03 bash image_capture.sh`. That first number `5226` is your PID.
2. Kill the process with `kill -9 5226`
