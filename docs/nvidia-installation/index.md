## NVIDIA Drivers
Before you get started, make sure you have installed NVIDIA driver for your corresponding Linux distribution. The recommended way to install drivers for Fedora is from [RPMFusion](https://rpmfusion.org/Howto/NVIDIA#Installing_the_drivers).

## Platform Requirements
NVIDIA Container Runtime is tested on:

- GNU/Linux x86_64 with kernel version > 3.10
???+ tip

    You can check your kernel version by running `uname -r` in your Linux terminal.

- Podman >= 4.0

(In case of Docker, Docker >= 19.03 (recommended, but some distributions may include older versions of Docker. The minimum supported version is 1.12))
???+ tip

    You can check your podman version by running `podman --version` in your Linux terminal.  In case of Docker, use `docker --version`.
    
- NVIDIA GPU with Architecture >= Kepler (or compute capability 3.0)
???+ tip

    You can check compute capability for your GPU on [NVIDIA CUDA GPUs Page](https://developer.nvidia.com/cuda-gpus#compute).
    
- [NVIDIA Linux Drivers](#nvidia-drivers) >= 418.81.07 (Note that older driver releases or branches are unsupported.)
???+ note
    Your driver version might limit your CUDA capabilities. Newer NVIDIA drivers are backwards-compatible with CUDA versions, but each new version of CUDA requires a minimum driver version. Running a CUDA container requires a machine with at least one CUDA-capable GPU and a driver compatible with the CUDA version you are using. The machine running the CUDA container only requires the NVIDIA driver, the CUDA toolkit doesn’t have to be installed. The [CUDA release notes](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#cuda-major-component-versions) includes a table of the minimum driver and CUDA versions.
    
## Set up NVIDIA Container Runtime
1. Set `distribution` value temporarily to `rhel9.0`; since NVIDIA doesn't directly support Fedora due to rolling release.
```bash
distribution=rhel9.0
```

2. Set the repository in repos list.
```bash
sudo curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.repo | tee /etc/yum.repos.d/nvidia-docker.repo
```

3. Install NVIDIA Container Toolkit using `dnf` on Fedora and Restart.
```bash
sudo dnf install nvidia-container-toolkit
```

4. Check if NVIDIA Container Runtime is working properly using `nvidia-container cli info`.
```bash
nvidia-container-cli info
```
This should show the similar following output.
```
NVRM version:   /* latest version number */
CUDA version:   /* latest cuda version */

Device Index:   0
Device Minor:   0
Model:          /* Your GPU Model */
Brand:          /* GPU Brand like Tesla, GeForce */
GPU UUID:       /* Specific UUID number for GPU */
Bus Location:   /* form of x:y:z:a */
Architecture:   /* GPU Architecture */
```
???+ info

    If nvidia-container-runtime is not working correctly, it might be probably SELinux issue:
    
    - Open `/etc/nvidia-container-runtime/config.toml` (if not present, check if your [NVIDIA Driver](#nvidia-drivers) is working correctly.
    - Change the following line
    ```
    #no-cgroups=false
    ```
    to
    ```
    no-cgroups=true
    ```
    - Restart your system to make changes.

## Make sure hook is present
Unlike Docker, Podman doesn't run on root. In order to make sure NVIDIA GPU is detected by Podman, a hook is needed. 

???+ info

    Make sure to check if `oci-nvidia-hook.json` is present in `/usr/share/containers/oci/hooks.d/`. If hook doesn't exist and NVIDIA Container Runtime is working, you can create a hook, copy the following code and save it as `oci-nvidia-hook.json`.

```
{
    "version": "1.0.0",
    "hook": {
        "path": "/usr/bin/nvidia-container-runtime-hook",
        "args": ["nvidia-container-runtime-hook", "prestart"],
        "env": [
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        ]
    },
    "when": {
        "always": true,
        "commands": [".*"]
    },
    "stages": ["prestart"]
}
```

