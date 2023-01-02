# Build (Using Podman)
## Prerequisites
1. Requires Internet Connection
2. [Podman](https://podman.io)

## Steps
1. After Installing Podman, create a new directory.
2. Inside the new directory, create another directory with any name for saving your codes (e.g: workdir).
2. Build the container using image from quay.io
```
podman pull quay.io/dkvc/os-xos:latest
```

4. Run the container and mount the empty directory with read-write permissions. Set the user ID of container to host user ID.
```
podman run --userns=keep-id -v $PWD/workdir:/home/xos/workdir:Z -d --name xos -i quay.io/dkvc/os-xos:latest
```

5. Execute the container/Connect using VSCode (Make sure to install Python extensions if used in VSCode)

## Post-Container Steps
1. If you want to open the container again after closing:
```
podman start xos
```

If you want to go into interactive shell mode:
```
podman exec -it xos /bin/bash
```

2. If you want to use containers in VSCode, make sure to install ![Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.

3. If you want to stop the container:
```
podman stop xos
```

## If pulling from quay.io doesn't work
1. After Installing Podman, create a new directory and copy Dockerfile from the repository into the directory.
2. Create empty directory with any name (e.g: workdir)
3. Build the container using Podman
```
podman build -t xos:ubuntu20.04 .
```

4. Run the container and mount the empty directory with read-write permissions. Set the user ID of container to host user ID.
```
podman run --userns=keep-id -v $PWD/workdir:/home/xos/workdir:Z -d --name xos -i xos:ubuntu20.04
```
