# SUI-Container
https://github.com/jeroenpardon/sui in a container!

Creates a Container which runs [jeroenpardon](https://github.com/jeroenpardon) [SUI](https://github.com/jeroenpardon/sui), with [httpd:alpine](https://hub.docker.com/_/httpd) as the base image, as seen on https://imgur.com/a/FDVRIyw

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
Simply put the Dockerfile in the same directory as your docker-compose.yml, edit your docker-compose.yml:
```
  sui:
    container_name: sui
    build: ./
    restart: unless-stopped
    ports:
      - 80:80
```
Then build with:
```
docker-compose up -d --build sui
```
![SUI](https://i.imgur.com/sTzMdMH.png)
