FROM alpine:3.4
RUN apk add --update curl tini && rm -rf /var/cache/apk/*
ENV VERSION v0.10.2
ENV CADDY caddy_$VERSION_linux_amd64
ENV DOWNLOAD https://github.com/mholt/caddy/releases/download/$VERSION/$CADDY.tar.gz
RUN curl -sLO $DOWNLOAD && \
    tar -xvzf $CADDY.tar.gz && \
    mv $CADDY /usr/bin/caddy && \
    chmod 755 /usr/bin/caddy && \
    rm -rf caddy_* && \
    rm -rf *.txt
