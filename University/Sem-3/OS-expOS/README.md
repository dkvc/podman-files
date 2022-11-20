# Build (Using Podman)
## Prerequisites
1. Requires Internet Connection
2. ![Podman](https://podman.io)

## Steps
1. After Installing Podman, create a new directory and copy Dockerfile from the repository into the directory.
2. Create empty directory with any name (e.g: workdir)
3. Build the container using Podman
```
podman build -t expos:ubuntu20.04 .
```

4. Run the container and mount the empty directory with read-write permissions. Set the user ID of container to host user ID.
```
podman run --userns=keep-id -v $PWD/workdir:/home/toolbox/workdir:Z -d --name expos -i expos:ubuntu20.04
```

5. Execute the container/Connect using VSCode (Make sure to install Python extensions if used in VSCode)

## Post-Container Steps
1. If you want to open the container again after closing:
```
podman start expos
```

If you want to go into interactive shell mode:
```
podman exec -it expos /bin/bash
```

2. If you want to use containers in VSCode, make sure to install ![Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.

3. If you want to stop the container:
```
podman stop expos
```
