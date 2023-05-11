# R Docker 4 remotePARTS

A barebones docker container to run remotePARTS.

To build the docker image run:
```
docker build -t <chosen-name-of-the-image>/remotePARST:<version-tag>
```

To run docker in an interactive mode run:
```
docker run -it --name remotePARTS <chosen-name-of-the-image>/remotePARST:<version-tag>
```

To run docker container with additional volumes mounted:
```
docker run -v /data:/data -v /mnt:/mnt -w $PWD -u $(id -u):$(id -g) -it --name remotePARTS <chosen-name-of-the-image>/remotePARST:<version-tag>
```

Use appropriate `--user`, `--volume`, `--workdir` options to define user-specific settings, to mount volumes necessary for the processing, and to define working directory inside the container, respectively.
Be carefull with using `$PWD` - when used, it makes a container notindependent from the local environment.
The use of `--cpus` can be desired to limit CPUs use allowed for a container. 

For a better experience, please add to the docker image R packages essential for your specific workflow(s).
