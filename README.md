RPiVideoLooper
==============
![alt tag](https://raw.github.com/StevenHickson/RPiVideoLooper/master/looper.png)

Video Looper for the Raspberry Pi

There are 3 main scripts.

startfullscreen.sh starts the looper script whether X is running or not. So it can work with SSH or headless. It also uses the xterm fullscreen hack to make a black fullscreen no matter the video resolution. It should be in the /home/pi/ directory

startvideos.sh loops through all the videos in the /home/pi/videos/ directory. It should be in the /home/pi/ directory.

videoloop sets up the service and starts it on boot. It calls startfullscreen.sh. It should be in the /etc/init.d/ directory.
You will have to use the update-rc.d script to set it to start on boot if you are not using the install script.

The install script is available if you don't want to download the image.

Rich Shumaker Note - I created a smaller image using Minibian - Link to File - https://drive.google.com/file/d/0B2w97gVYBA8wYWNxQm1pVUFYSG8/view?usp=sharing
