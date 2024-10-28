FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    mariadb\
    mariadb-client\
    envsubst

COPY conf/setup-database /tmp/
COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

RUN adduser mysql mysql
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /run/mysqld

RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql/

RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql --force

EXPOSE 3306

# CMD ["mariadbd", "--user=mysql", "--init-file=/tmp/"]

CMD ["./tmp/init.sh"]
