#!/bin/bash
#Copy log0 and start TAP Interface on boot

export DISPLAY=:0.0
num=$(find /home/sterling/logs -maxdepth 1 -type f -name "logbkup*.txt" -exec printf x \; | wc -c)
cp /home/sterling/logs/log0.txt /home/sterling/logs/logbkup$num.txt

sleep 10
gnome-terminal --window-with-profile="Starter" -e "node /home/sterling/TAPInterface/index"
