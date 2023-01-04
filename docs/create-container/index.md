## Creating a Container
- Create a new directory for storing your project files (e.g. `workdir`).
???+ danger "Storing your files"
    Make sure to store your files in corresponding directory to avoid losing your files while updating containers.








If you don't want to pull from my repository, you can create a file named `Dockerfile` and copy the following text:
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

???+ info "Avoiding Permission Issues"
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
