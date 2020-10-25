# SUI-Container
https://github.com/jeroenpardon/sui in a container!

![Docker Pulls](https://img.shields.io/docker/pulls/griefed/sui?style=flat-square)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/griefed/sui?label=Image%20size&sort=date&style=flat-square)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/griefed/sui?label=Docker%20build&style=flat-square)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/griefed/sui?label=Docker%20build&style=flat-square)
![GitHub Repo stars](https://img.shields.io/github/stars/Griefed/docker-SUI?label=GitHub%20Stars&style=social)
![GitHub forks](https://img.shields.io/github/forks/Griefed/docker-SUI?label=GitHub%20Forks&style=social)

Creates a Container which runs [jeroenpardon's](https://github.com/jeroenpardon) [SUI](https://github.com/jeroenpardon/sui), with [httpd:alpine](https://hub.docker.com/_/httpd) as the base image, as seen on https://imgur.com/a/FDVRIyw

# Deploy with docker-compose:
```
  sui:
    container_name: sui
    image: griefed/sui
    restart: unless-stopped
    ports:
      - 80:80
```
### Deploy on Rasbperry Pi
Using the Dockerfile, this container can be built and run on a Raspberry Pi, too! I've tested it on a Raspberry Pi 3B+.
Simply put the Dockerfile in a directory called `SUI` in the same directory as your docker-compose.yml, edit your docker-compose.yml:
```
  sui:
    container_name: sui
    build: ./SUI/
    restart: unless-stopped
    ports:
      - 80:80
```
Then build with:
```
docker-compose up -d --build sui
```
![SUI](https://i.imgur.com/sTzMdMH.png)
