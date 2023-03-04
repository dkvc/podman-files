FROM ros:latest

WORKDIR /home/ROS/

COPY bashaliases.sh bashaliases.sh
RUN bash bashaliases.sh
RUN rm bashaliases.sh

RUN apt update && apt-get update

RUN apt install apt-utils -y
RUN apt install ros-humble-turtlesim -y
RUN apt install ~nros-humble-rqt* -y

LABEL org.opencontainers.image.source=https://github.com/dkvc/podman-files
