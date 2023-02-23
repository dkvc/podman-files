## Allow host system to use X Display Server
Open your host terminal and run the following command: (The plus sign is optional)
```
xhost +local:podman
```
???+ info "Using Docker"
    If you are running `docker`, change `podman` to `docker` in the corresponding command:
    ```
    xhost +local:docker
    ```

## Connect container display to current host display

???+ info "For Non-NVIDIA users"
    If you don't have NVIDIA graphics card installed or NVIDIA graphics is not required in container, then you can use the following command:
    ```
    podman run --userns=keep-id -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -d --name <name> -i <image>
    ```

In the following command, `-e DISPLAY=$DISPLAY` syncs your environment variable `DISPLAY` from host system to container.
```
podman run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ -d --name <name> -i <image>
```

???+ warning "--hooks-dir"
    The `--hooks-dir` in the following command is related to [NVIDIA Installation](https://dkvc.github.io/podman-files/nvidia-installation/).

For example, if there exists a image tagged `ros:latest` on your system, the command would be:
```
podman run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ -v $PWD/ROS:/home/ROS:Z -d --name ros2 -i ros:latest
```

For remaining steps, you can follow [Container](https://dkvc.github.io/podman-files/create-container/) documentation.
