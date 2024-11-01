#! /bin/sh

./usr/bin/mariadb-install-db --verbose --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --force

chown -R mysql:mysql /var/lib/mysql/aria_log_control

mv /tmp/setup-database.sql /tmp/setup-database.sql.bak
envsubst < /tmp/setup-database.sql.bak > /tmp/setup-database.sql
chmod +x /tmp/setup-database.sql

mariadbd --user=mysql --init-file="/tmp/setup-database.sql"
