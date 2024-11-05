#! /bin/sh

# ./usr/bin/mariadb-install-db --verbose --user=mysql --datadir=/var/lib/mysql --force

chown -R mysql:mysql /var/lib/mysql/aria_log_control

mv /tmp/setup-database.sql /tmp/setup-database.sql.bak

envsubst '${DATABASE_NAME} ${MARIADB_USER} ${MARIADB_USER_PASSWORD} ${MARIADB_ROOT_PASSWORD}' < /tmp/setup-database.sql.bak > /tmp/setup-database.sql
chmod +x /tmp/setup-database.sql

mariadbd --user=mysql --init-file="/tmp/setup-database.sql"
