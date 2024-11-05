FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    mariadb\
    mariadb-client\
    envsubst\
    shadow

# database config
COPY conf/mariadb-server.cnf /etc/my.cnf.d/

# database initial setup
COPY conf/setup-database.sql /tmp/

# init sript
COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

# user mysql
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /run/mysqld

# user www-data
RUN useradd www-data -g www-data
RUN usermod -aG www-data mysql

RUN mkdir -p /var/lib/mysql
RUN chown -R www-data:www-data /var/lib/mysql

# install database
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql --force

EXPOSE 3306

CMD ["./tmp/init.sh"]
