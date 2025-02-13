# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:noetic-ros-core-focal

# Задаём переменную окружения, чтобы пользователь не участвовал в установке (выбор клавиатуры и прочее)
ENV DEBIAN_FRONTEND=noninteractive



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

# копируем ROS Workspace с пакетами
#RUN mkdir -p /home/${USER}/ros_workspace
COPY ros_workspace/ /home/vancho/Linux4RoboticistFinal/docker_image/ros_workspace
# COPY folder1 /home


# SSH и nano
 RUN apt-get update && apt-get install -y openssh-server 
 RUN apt-get install -y nano
 # или https://vmblog.ru/ssh-vhod-v-docker-kontejner/
#
#RUN apt update && apt install openssh-server sudo -y
#RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
#RUN echo 'test:testpassw123' | chpasswd
#RUN service ssh start
#EXPOSE 22
#CMD ["/usr/sbin/sshd","-D"]





# Drivers
# дальномер
# sudo apt install ros-noetic-lsc-ros-driver    
# roslaunch lsc_ros_driver lsc_c25_launch.launch
RUN apt-get update && apt-get install -y ros-noetic-lsc-ros-driver



# камера
# apt-get install ros-noetic-libuvc-camera 
# chmod o+w /dev/bus/usb/001/002 
RUN apt-get update && apt-get install -y ros-noetic-libuvc-camera 

RUN /bin/bash -c 'source /opt/ros/noetic/setup.bash;\
    echo "source /home/vancho/Linux4RoboticistFinal/docker_image/ros_workspace/devel/setup.bash" >> ~/.bashrc'

    #cd /MY_PROJECT;\
   # catkin_make -j8;\


# Копируем в образ нашу программу
COPY init.sh /init.sh

# Запускаем программу при старте контейнера
#CMD ["./init.sh"]

CMD ["./bin/bash"]

