## System Requirements
Make sure your system is qualified for requirements (irrespective of operating system) on [Requirements](https://www.tensorflow.org/install).

## Select a image
While there are different releases (base tags) of Tensorflow, the instructions use the default `latest` version. In each base tag, there are multiple variants using two tags.
- `tag-gpu` - Specified tag release with GPU Support
- `tag-jupyter` - Specified tag release with Jupyter (includes Tensorflow tutorial notebooks)

You can mix both tags using `tag-gpu-jupyter` which includes Jupyter as well as GPU support. The following instructions uses this tag as default.
```
podman pull tensorflow/tensorflow:latest-gpu-jupyter
```
???+ info

    If Podman prompts for selecting repository, select `docker.io` (Docker Hub) repository.
    
## Check if podman image is working
Use the following command to check if image is working.
```
podman run --rm --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ docker.io/tensorflow/tensorflow:latest-gpu-jupyter python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

In the following command, a container is created, SELinux is configured to ignore the container, NVIDIA hook is connected and runs the corresponding command:
```
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```
in the container. If the output is:
```
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```
, then the installation steps are performed correctly. In case of error or output `[]`, please check if you have missed any installation steps.
