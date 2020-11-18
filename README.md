[![docker-SUI](img/docker-SUI_header.png)](https://github.com/Griefed/docker-SUI)

---

[![Docker Pulls](https://img.shields.io/docker/pulls/griefed/sui?style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/griefed/sui?label=Image%20size&sort=date&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/griefed/sui?label=Docker%20build&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/griefed/sui?label=Docker%20build&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui)
[![GitHub Repo stars](https://img.shields.io/github/stars/Griefed/docker-SUI?label=GitHub%20Stars&style=social)](https://github.com/Griefed/docker-SUI)
[![GitHub forks](https://img.shields.io/github/forks/Griefed/docker-SUI?label=GitHub%20Forks&style=social)](https://github.com/Griefed/docker-SUI)

docker-SUI

A startpage for your server and / or new tab page

[![sui](img/docker-SUI_screenshot.png)](https://github.com/jeroenpardon/sui)

---

Creates a Container which runs [jeroenpardon's](https://github.com/jeroenpardon) [sui](https://github.com/jeroenpardon/sui), with [lsiobase/nginx](https://hub.docker.com/r/lsiobase/nginx) as the base image, as seen on https://imgur.com/a/FDVRIyw.

The [lsiobase/nginx](https://hub.docker.com/r/lsiobase/nginx) image is a custom base image built with [Alpine linux](https://alpinelinux.org/) and [S6 overlay](https://github.com/just-containers/s6-overlay).
Using this image allows us to use the same user/group ids in the container as on the host, making file transfers much easier

## Deployment

### Pre-built images

```docker-compose.yml
version: '3.6'
services:
  sui:
    container_name: sui
    image: griefed/sui
    restart: unless-stopped
    volumes:
      - ./path/to/config:/config
    environment:
      - TZ=Europe/Berlin
      - PUID=1000  # User ID
      - PGID=1000  # Group ID
      - DOMAIN=www.example.com
      - PROTOCOL=https
    ports:
      - 80:80
      - 443:443
```

## Raspberry Pi

To run this container on a Raspberry Pi, use the `arm`-tag. I've tested it on a Raspberry Pi 3B.

`griefed/sui:arm`

## Configuration

Configuration | Explanation
------------ | -------------
[Restart policy](https://docs.docker.com/compose/compose-file/#restart) | "no", always, on-failure, unless-stopped
config volume | Contains config files and logs.
data volume | Contains your/the containers important data.
TZ | Timezone
PUID | for UserID
PGID | for GroupID
DOMAIN | The address of the device this container is running on. Can be an IP or sub.domain.tld.
PROTOCOL | The protocol used to access this container. Either HTTP or HTTPS.
ports | The port where the service will be available at.

## User / Group Identifiers

When using volumes, permissions issues can arise between the host OS and the container. [Linuxserver.io](https://www.linuxserver.io/) avoids this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```

### Building the image yourself

Use the [Dockerfile](https://github.com/Griefed/docker-SUI/Dockerfile) to build the image yourself, in case you want to make any changes to it

#### docker-compose.yml

```docker-compose.yml
version: '3.6'
services:
  sui:
    container_name: sui
    build: ./docker-SUI/
    restart: unless-stopped
    volumes:
      - ./path/to/config/files:/config
    environment:
      - TZ=Europe/Berlin
      - PUID=1000  # User ID
      - PGID=1000  # Group ID
      - DOMAIN=www.example.com
      - PROTOCOL=https
    ports:
      - 8080:80
      - 443:443
```

1. Clone the repository: `git clone https://github.com/Griefed/docker-SUI.git ./docker-SUI`
1. Prepare docker-compose.yml file as seen above
1. `docker-compose up -d --build sui`
1. Visit IP.ADDRESS.OF.HOST:8080
1. ???
1. Profit!
