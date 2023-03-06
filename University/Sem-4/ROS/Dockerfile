FROM ros:latest

WORKDIR /home/ROS/

COPY bashaliases.sh bashaliases.sh
RUN bash bashaliases.sh
RUN rm bashaliases.sh

RUN apt update && apt-get update

RUN apt install apt-utils python-is-python3 python3-pip ros-humble-turtlesim ~nros-humble-rqt* -y

LABEL org.opencontainers.image.source=https://github.com/dkvc/podman-files
