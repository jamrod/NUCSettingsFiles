#!/bin/bash
#Launch x11vnc on boot

x11vnc -forever -display :0 -rfbauth /home/sterling/.x11vnc/passwd


