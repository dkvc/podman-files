## Creating a Container
- Create a new directory for storing your project files (e.g. `workdir`).
???+ danger "Storing your files"
    Make sure to store your files in corresponding directory to avoid losing your files while updating containers.

- Create a file named `Dockerfile` and copy the following text:
```Dockerfile
FROM tensorflow:latest-gpu-jupyter

RUN useradd -m tf
USER tf

WORKDIR /home/tf/
```

- Build the container using your own tag name (e.g.: `tftest:tensorflow`)
```bash
podman build -t tftest:tensorflow .
```

## Running the Container
To run the container using Podman, use the following command:
```
podman run --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ -v $PWD/workdir:/home/tf/workdir:Z -d --name tftest -i tftest:tensorflow
```
???+ info "Local Jupyter"
    In case you want to use Local Jupyter Server directly instead of Visual Studio Code or any IDE, make sure to link port 8888 to host system; which is used for hosting Jupyter server.
    ```
    podman run --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ -p 8888:8888 -v $PWD/workdir:/home/tf/workdir:Z -d --name tftest -i tftest:tensorflow
    ```
    If you want to know the URL of Jupyter Server after starting, you can use
    ```
    podman exec -it tftest jupyter notebook
    ```

???+ info "Avoiding Permission Issues (Not Required for Docker users)"
    If you want to avoid permission issues everytime when you share any file between container and host using shared folder, you can use the following command both inside and outside the container (not recommended).
    ```
    chmod 777 workdir
    ```
    
## Post-Container Steps
- If you want to open the contaner again after closing:
```
podman start tftest
```

- If you want to stop the container:
```
podman stop tftest
```

- Make sure to install [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python) if you are trying to use container in Visual Studio Code.
