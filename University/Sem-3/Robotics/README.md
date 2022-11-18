# Build (Using Podman)
## Prerequisites
1. Requires Internet Connection
2. [Podman] (https://podman.io)

## Steps
1. After Installing Podman, create a new directory and put Dockerfile and requirements.txt from the repository into the directory.
2. Create empty directory with any name (e.g: workdir)
3. Build the container using Podman
```
podman build -t robotics:python
```

4. Run the container and mount the empty directory with read-write permissions. Set the user ID of container to host user ID.
```
podman run --userns=keep-id -v $PWD/workdir:/home/toolbox/workdir:Z -d --name robotics -i robotics:python
```

5. Execute the container/Connect using VSCode (Make sure to install Python extensions if used in VSCode)
