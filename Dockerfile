FROM alpine:3.4
RUN apk add --update curl tini && rm -rf /var/cache/apk/*
ENV VERSION v0.10.2
ENV DOWNLOAD https://github.com/mholt/caddy/releases/download/$VERSION/caddy_$VERSION_linux_amd64.tar.gz
RUN curl -sLO $DOWNLOAD && \
    tar -xvzf caddy_linux_amd64.tar.gz && \
    mv caddy_linux_amd64 /usr/bin/caddy && \
    chmod 755 /usr/bin/caddy && \
    rm -rf caddy* && \
    rm -rf *.txt
