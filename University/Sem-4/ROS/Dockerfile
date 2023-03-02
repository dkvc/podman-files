FROM ros:latest

WORKDIR /home/ROS/

COPY bashaliases.sh bashaliases.sh
RUN bash bashaliases.sh
RUN rm bashaliases.sh

RUN apt update && apt-get update

RUN apt install ros-humble-turtlesim -y
RUN apt install ~nros-humble-rqt* -y
RUN apt install vim ros-humble-demo-nodes-cpp ros-humble-demo-nodes-py -y

LABEL org.opencontainers.image.source=https://github.com/dkvc/podman-files

# run launch file
CMD ["ros2", "launch", "demo_nodes_cpp", "talker_listener.launch.py"]
