[![docker-SUI/tree/lsiobase/nginx-dashboard](https://i.griefed.de/images/2020/11/19/docker-SUI_Dashboard_header.png)](https://github.com/Griefed/docker-SUI/tree/lsiobase/nginx-dashboard)

---

[![Docker Pulls](https://img.shields.io/docker/pulls/griefed/sui-dashboard?style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui-dashboard)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/griefed/sui-dashboard?label=Image%20size&sort=date&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui-dashboard)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/griefed/sui-dashboard?label=Docker%20build&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui-dashboard)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/griefed/sui-dashboard?label=Docker%20build&style=flat-square)](https://hub.docker.com/repository/docker/griefed/sui-dashboard)
[![GitHub Repo stars](https://img.shields.io/github/stars/Griefed/docker-SUI?label=GitHub%20Stars&style=social)](https://github.com/Griefed/docker-SUI)
[![GitHub forks](https://img.shields.io/github/forks/Griefed/docker-SUI?label=GitHub%20Forks&style=social)](https://github.com/Griefed/docker-SUI)

docker-SUI/tree/lsiobase/nginx-dashboard

A startpage for your server and / or new tab page as well as a status display for configured apps

[![sui-dashboard-status](https://i.griefed.de/images/2020/11/19/docker-SUI_Dashboard_screenshot.png)](https://github.com/ThreadR-r/sui-dashboard-status)

---

Creates a Container which runs [ThreadR-r's](https://github.com/ThreadR-r) [sui-dashboard-status](https://github.com/ThreadR-r/sui-dashboard-status), a fork of [jeroenpardon's](https://github.com/jeroenpardon) [sui](https://github.com/jeroenpardon/sui) with [lsiobase/nginx](https://hub.docker.com/r/lsiobase/nginx) as the base image.

The [lsiobase/nginx](https://hub.docker.com/r/lsiobase/nginx) image is a custom base image built with [Alpine linux](https://alpinelinux.org/) and [S6 overlay](https://github.com/just-containers/s6-overlay).
Using this image allows us to use the same user/group ids in the container as on the host, making file transfers much easier

## Deployment

### Pre-built images

```docker-compose.yml
version: '3.6'
services:
  sui-dashboard:
    container_name: sui-dashboard
    image: griefed/sui-dashboard
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

`griefed/sui-dashboard:arm`

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

### Apps
Add your apps by editing apps.json:

    {
	    "apps" : [
		    {"name":"Name of app 1","hostname":"sub1.example.com","port":80,"href":"https://sub1.example.com" ,"icon":"icon-name"},
		    {"name":"Name of app 2","hostname":"sub2.example.com""port":8080,"href":"https://sub1.example.com" ,"icon":"icon-name"}
	    ]
    }

Please note:

 - No `,` at the end of the last app's line
 - Find the names  of icons to use at [Material Design Icons](https://materialdesignicons.com/)

### Bookmarks
Add your bookmarks by editing links.json:

```
{
   "bookmarks":[
      {
         "category":"Category1",
         "links":[
            {
               "name":"Link1",
               "url":"http://example.com"
            },
            {
               "name":"Link2",
               "url":"http://example.com"
            }
         ]
      },
      {
         "category":"Category2",
         "links":[
            {
               "name":"Link1",
               "url":"http://example.com"
            },
            {
               "name":"Link2",
               "url":"http://example.com"
            }
         ]
      }
   ]
}
```
Add names for the categories you wish to define and add the bookmarks for each category.

Please note:

 - No `,` at the end of the last bookmark in a category and at the end of the last category

## User / Group Identifiers

When using volumes, permissions issues can arise between the host OS and the container. [Linuxserver.io](https://www.linuxserver.io/) avoids this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```

### Building the image yourself

Use the [Dockerfile](https://github.com/Griefed/docker-SUI/tree/lsiobase/nginx-dashboard/Dockerfile) to build the image yourself, in case you want to make any changes to it

#### docker-compose.yml

```docker-compose.yml
version: '3.6'
services:
  sui-dashboard:
    container_name: sui-dashboard
    build: ./docker-SUI/tree/lsiobase/nginx-dashboard/
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

1. Clone the repository: `git clone https://github.com/Griefed/docker-SUI/tree/lsiobase/nginx-dashboard.git ./docker-SUI/tree/lsiobase/nginx-dashboard`
1. Prepare docker-compose.yml file as seen above
1. `docker-compose up -d --build sui-dashboard`
1. Visit IP.ADDRESS.OF.HOST:8080
1. ???
1. Profit!
