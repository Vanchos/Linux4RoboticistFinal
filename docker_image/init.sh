#!/bin/sh
echo "Hello, I'm script, that work in docker!"
echo "Today is " $(date +"%d.%m.%Y")

#source /opt/ros/noetic/setup.bash
#source /home/vancho/Linux4RoboticistFinal/docker_image/ros_workspace/devel/setup.bash
# запуск roscore
# roscore &
# запускаем демона ssh
/usr/sbin/sshd -D
# даем права доступа к камере ноутбука
chmod o+w /dev/bus/usb/001/002 
# запуск ноды робота
roslaunch wrh_robot wrh.launch

