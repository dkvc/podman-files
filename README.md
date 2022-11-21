# Podmanfiles
Personal Repository of Podman Scripts/Dockerfiles created during learning of Podman

## Make sure to use **WORKDIR** in your container to store your files. The container itself is temporary, particularly during rebuilding of your container using updated Dockerfile.

# WARNING FOR USERS USING DOCKER and NON-LINUX USERS!
The files are currently tested using Podman containers on Linux. It may or may not work on Docker or non-Linux computers. Use at your own risk.

## Steps to use Podman containers on VSCode
1. Install ![Podman](https://podman.io)
2. Install ![Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VSCode
3. In VSCode, change the value of **dev.containers.dockerPath** in Preferences from *docker* to *podman*.

**Note: VSCode requires VSCode Server for managing remote development and containers. When you open a container for first time in VSCode, it may take time depending on your internet connection.**
