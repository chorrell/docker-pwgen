# syntax=docker/dockerfile:1
FROM alpine:3

LABEL org.opencontainers.image.source=https://github.com/chorrell/docker-pwgen

RUN set -ex \
    && apk add --no-cache pwgen=~2.08

COPY --link docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pwgen"]
