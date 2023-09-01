# R Docker 4 remotePARTS

A barebones docker container to run [remotePARTS](https://github.com/morrowcj/remotePARTS).

Copy the docker image from this repo or pull the docker container from the docker hub
```console
docker build -t <chosen-name-of-the-image>/rparts:<version-tag>
```

```console
docker pull kelewinska/rparts:latest
```

Build the docker image:

```console
# the '-t' flag passes the name of the container in the local environment
docker build -t kelewinska/rparts:<version-tag>
```

Run docker image `kelewinska/rparts:<version-tag>` in an interactive container named `rparts` :

```console
docker run -it --name rparts kelewinska/rparts:<version-tag>
```

Run docker image `kelewinska/rparts:<version-tag>` in an interactive container named `rparts` with additional volumes mounted:

```console
docker run -v /data:/data -v /mnt:/mnt -w $PWD -u $(id -u):$(id -g) -it --name rparts kelewinska/rparts:<version-tag>
```

Use appropriate `--user`, `--volume`, `--workdir` options to define user-specific settings, to mount volumes necessary for the processing, and to define working directory inside the container, respectively.
Be careful with using `$PWD` - when used, it makes a container nonindependent from the local environment.
The use of `--cpus` can be desired to limit CPUs use allowed for a container.
Or even better `--cpuset-cpus` to indicate the cpus available for a container (their use will be maxed out according to the processing done in a container).

```console
docker run -v /data:/data -v /mnt:/mnt -u $(id -u):$(id -g) -it `--cpuset-cpus`="0-19" --name rparts kelewinska/rparts:<version-tag>
```

For better experience, please add to the docker image R packages essential for your specific workflow(s).

The current `:latest` image is build based on `r-base:4.3.1`.
