#! /bin/sh

./usr/bin/mariadb-install-db --verbose --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --force

chown -R mysql:mysql /var/lib/mysql/aria_log_control

mv /tmp/setup-database /tmp/setup-database.bak
envsubst < /tmp/setup-database.bak > /tmp/setup-database

mariadbd --user=mysql --init-file="/tmp/setup-database"
