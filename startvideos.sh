#!/bin/bash

declare -A vids

#Make a newline a delimiter instead of a space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

usb=`cat /boot/looperconfig.txt | grep usb | cut -c 5- | tr -d '\r' | tr -d '\n'`

FILES=/home/pi/videos/

if [[ $usb -eq 1 ]]; then
    FILES=/media/USB/videos/
fi

current=0
for f in `ls $FILES | grep ".mp4$\|.avi$\|.mkv$\|.mp3$\|.mov$\|.mpg$\|.flv$\|.m4v$"`
do
        vids[$current]="$f"
        let current+=1
	echo "$f"
done
max=$current
current=0

#Reset the IFS
IFS=$SAVEIFS

while true; do
if pgrep omxplayer > /dev/null
then
	echo 'running'
else
	let current+=1
	if [ $current -ge $max ]
	then
		current=0
	fi

	/usr/bin/omxplayer -r -o hdmi "$FILES${vids[$current]}"
fi
done
