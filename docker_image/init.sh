#!/bin/sh

source /opt/ros/noetic/setup.bash
source /home/vancho/Linux4RoboticistFinal/docker_image/ros_workspace/devel/setup.bash

# chmod o+w /dev/bus/usb/001/002 

# запуск ноды робота
roscore &

roslaunch wrh_robot wrh.launch

echo "Hello, I'm script, that work in docker!"
echo "Today is " $(date +"%d.%m.%Y")