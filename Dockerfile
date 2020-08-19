FROM httpd:alpine

LABEL maintainer="Griefed <griefed@griefed.de>"

RUN apk update                                                  && \
    apk upgrade                                                 && \
    apk add --no-cache git                                      && \
    cd /usr/local/apache2/htdocs/                               && \
    rm -rf ./*                                                  && \
    git clone https://github.com/jeroenpardon/sui.git ./        && \
    rm Dockerfile docker-compose.yml                            && \
    rm -rf /var/cache/apk/*

WORKDIR /usr/local/apache2/htdocs

EXPOSE 80
