#! /bin/sh

./usr/bin/mariadb-install-db --verbose --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --force
# ./usr/bin/mariadb-secure-installation --user=mysql --datadir=/var/lib/mysql --force

# ls /usr/bin | grep ^m

chown -R mysql:mysql /var/lib/mysql/aria_log_control

mariadbd --user=mysql &

# # ls /usr/bin/
./usr/bin/mariadb-admin -u root password ${MYSQL_ROOT_PASSWORD}
# kill mariadbd
# mariadbd --user=mysql