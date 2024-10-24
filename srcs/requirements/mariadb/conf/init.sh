#! /bin/sh

# mysql_install_db --user=mysql --datadir=/var/lib/mysql


# ./etc/init.d/mariadb start

# cat /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb status

mysqld --user=mysql

mysqladmin -u root password ${MYSQL_ROOT_PASSWORD}