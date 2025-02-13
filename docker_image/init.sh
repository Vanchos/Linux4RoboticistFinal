#!/bin/sh

source /opt/ros/noetic/setup.bash
source /home/${USER}/ros_workspace/devel/setup.bash

# chmod o+w /dev/bus/usb/001/002 

echo "Hello, I'm script, that work in docker!"
echo "Today is " $(date +"%d.%m.%Y")