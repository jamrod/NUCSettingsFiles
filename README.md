# NUCSettingsFiles
Settings used for mini PC running TAP Interface
I'm using this repo to keep back-ups scripts and the crontab I set up to have my app run on start up and vnc access start on boot.
I took me alot of time to figure out how to get these things to work so I wanted to keep them here for the next time I need to figure it out.
Auto login also needs to be enabled for this stuff to work.

The CRONTAB file basically just contains these three lines:
```
SHELL=/bin/bash
#Script to start TAP Interface on boot
@reboot /usr/scripts/startTAPInterface.sh >> /usr/scripts/log.txt
```

The startTAPInterface script contains these lines
```
#!/bin/bash
#Copy log0 and start TAP Interface on boot

export DISPLAY=:0.0
num=$(find /home/sterling/logs -maxdepth 1 -type f -name "logbkup*.txt" -exec printf x \; | wc -c)
cp /home/sterling/logs/log0.txt /home/sterling/logs/logbkup$num.txt

sleep 10
gnome-terminal --window-with-profile="Starter" -e "node /home/sterling/TAPInterface/index"
```

The script to run vnc on start up contains these lines
```
#!/bin/bash
#Launch x11vnc on boot

x11vnc -forever -display :0 -rfbauth /home/USER/.x11vnc/passwd
```
