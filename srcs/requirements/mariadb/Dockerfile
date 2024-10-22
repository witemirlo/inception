# https://wiki.alpinelinux.org/wiki/MariaDB
# mysql in Alpine linux install mariadb instead

FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    mariadb\
    mariadb-common\
    mariadb-client

CMD ["mariadb"]