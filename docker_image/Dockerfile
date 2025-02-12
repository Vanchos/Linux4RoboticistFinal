# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:noetic-ros-core-focal

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-ros-base=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*



# Drivers
# дальномер
# apt install ros-noetic-lsc-ros-driver    
# roslaunch lsc_ros_driver lsc_c25_launch.launch

# камера
# apt-get install ros-noetic-libuvc-camera 
# chmod o+w /dev/bus/usb/001/002 
# roslaunch honor_cam elp.launch 