FROM alpine:3.4
EXPOSE 80 443
RUN apk add --update curl tini && rm -rf /var/cache/apk/*
ENV VERSION v0.9.3
ENV DOWNLOAD https://github.com/mholt/caddy/releases/download/$VERSION/caddy_linux_amd64.tar.gz
RUN curl -sLO $DOWNLOAD && \
    tar -xvzf caddy_linux_amd64.tar.gz && \
    mv caddy_linux_amd64 /usr/bin/caddy && \
    chmod 755 /usr/bin/caddy && \
    rm -rf caddy* && \
    rm -rf *.txt
ADD caddy/caddyfile /etc/caddy/
WORKDIR /home/caddy
CMD ["caddy","-conf=/etc/caddy/caddyfile"]
