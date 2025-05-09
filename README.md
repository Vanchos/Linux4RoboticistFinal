# Гипотетический робот "Wheelchair Rider Helper" (WRH_Robot)
Финальная работа по курсу Linux для робототехников. Docker Image для робота

 ## Задача робота
 Робот предназначен для предотвращения наезда инвалидной коляски с ручным приводом на препятствие, которое она преодолеть не в состоянии.

 ## Способ решения
1. Своевременное отслеживание приближения каждого колеса коляски к непреодолимому препятствию.  
> Критерий "непреодолимости" задается в виде высоты препятствия над уровнем поверхности.  
> Своевременность определяется количеством секунд до столкновения.
2. Препятствование продолжению движения в выбранном направлении в случае срабатывания критериев "непреодолимости" и "своевременности"
## Реализация
![](/img/sxema-1.png)
В качестве реализации предлагается создать программно-аппаратный комплекс, реагирующий на сближение с опасным препятствием путем запуска механизма торможения.\
Данный комплекс должен будет монтироваться на все типовые конструкции инвалидных колясок.

### Состав аппаратной части комплекса:
- контроллер для размещения программной сроставляющей и для подключения аппаратных элементов комплекса
- лазерный дальномер, размещаемый на фронтальной части коляски напротив левого колеса, на высоте, обеспеччивающей обнаружение непреодолимого препятсявия и работающий с частотой позволяющей заблаговременно определить опасное сближение в зависимости от скорости движения коляски
- камера, размещаемая на фронтальной части коляски для визуального контроля обстановки пользователем
- монитор для показа изображений с камеры
- привод тормоза в количестве 2 шт монтируемый на каждое из колес и формирующий необходимое сопротивление для вращения колес для обеспечения плавного торможения

### Архитектура программной части комплекса

#### Узлы (Nodes)

- Драйвер лазерного дальномера (LSC-C Series - ros-noetic-lsc-ros-driver https://wiki.ros.org/lsc_ros_driver | https://github.com/AutonicsLiDAR/lsc_ros_driver/tree/master) - **node name="lsc_laser_publisher"**
- Драйвер камеры (USB Video Class camera driver - ros-noetic-libuvc-cam https://wiki.ros.org/libuvc_camera) **node name="mycam"**
- Драйвер привода тормоза (гипотетический)
- Модуль управления (например, Raspberry Pi 4 Model B 2Gb)

#### Топики (Topics)
- Данные дальномера
- Данные камеры

#### Сервисы (Services)
- Запуск торможения

#### Резюме
>Программная часть реализована в виде ROS-пакета [wrh_robot](docker_image/ros_workspace/src/wrh_robot) включающего ноды камеры и [дальномера](https://github.com/AutonicsLiDAR/lsc_ros_driver)  
>Запуск пакета осуществляется с помощью launch-файла [wrh.launch](docker_image/ros_workspace/src/wrh_robot/launch/wrh.launch)

>Все зависимости, а также драйвера собраны в [Dockerfile](docker_image/Dockerfile)

### Работа ROS-пакета

![](/img/rosnodes.jpg)

## Инструкция по установке

### Docker

1. Создайте папку "vancho" в каталоге "Home" и перейдите в нее.
2. Клонируйте сюда проект с GitHub: https://github.com/Vanchos/Linux4RoboticistFinal
3. Перейдите в папку /home/vancho/Linux4RoboticistFinal/docker_image
4. Постройте Docker: `$ docker build -t docker-wrh .`
5. Запустите docker, с пробросом в него камеры с ноутбука и порта для ssh: `docker run -it --device=/dev/bus/usb/001/002 -p 50022:22 docker-wrh`
6. В терминале запущенного docker (`docker exec -it "CONTAINER ID" /bin/bash`) запустите скрипт init.sh или последовательно выполните команды:
    - `/usr/sbin/sshd -D`
    - `chmod o+w /dev/bus/usb/001/002`
    - `roslaunch wrh_robot wrh.launch`  
![](/img/launch.jpg)

7. Для доступа по SSH 
    - Определите "CONTAINER ID" контейнера `docker ps` 
    - Определите IP контейнера `sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" CONTAINER ID`
    - Запустите SSH-клиент на хосте: `ssh sshuser@IP`
    - Введите пароль для sshuser: `12345`  
![](/img/ssh.jpg)

