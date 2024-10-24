FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    openrc\
    mariadb\
    mariadb-client

COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /run/mysqld

RUN /usr/bin/mysql_install_db --user=mysql --force

EXPOSE 3306

CMD ["mariadbd", "--user=mysql"]