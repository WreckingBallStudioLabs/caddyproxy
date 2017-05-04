FROM alpine:3.4
RUN apk add --update curl tini && rm -rf /var/cache/apk/*
ENV VERSION v0.10.2
ENV TARBALL="caddy_${VERSION}_linux_amd64.tar.gz"
ENV DOWNLOAD https://github.com/mholt/caddy/releases/download/$VERSION/$TARBALL
RUN mkdir /usr/bin/caddy && \
    cd /usr/bin/caddy && \
    curl -sLO $DOWNLOAD && \
    tar -xvzf $TARBALL && \
    chmod 755 /usr/bin/caddy/caddy && \
    rm -rf caddy_* && \
    rm -rf *.txt
