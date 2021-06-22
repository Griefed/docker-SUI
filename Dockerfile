FROM lsiobase/nginx:3.14

LABEL maintainer="Griefed <griefed@griefed.de>"

RUN \
    echo "**** Install dependencies, build tools and stuff ****" && \
    apk add --no-cache \
      git && \
    echo "**** Cleanup ****" && \
    rm -rf \
      /root/.cache \
      /tmp/*

# Copy local files
COPY root/ /

# Communicate ports and volumes to be used
EXPOSE 80 443

VOLUME /config