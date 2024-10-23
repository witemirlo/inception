FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    mariadb\
    mariadb-client

COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

EXPOSE 3306

CMD ["./tmp/init.sh"]