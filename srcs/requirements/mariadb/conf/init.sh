#! /bin/sh

# change permissions in the working directory of mariadb
chown -R mysql:mysql /var/lib/mysql

# create backup file
mv /tmp/setup-database.sql /tmp/setup-database.sql.bak

# expand enviroment variables and save it in the correct file
envsubst '${DATABASE_NAME} ${MARIADB_USER} ${MARIADB_USER_PASSWORD} ${MARIADB_ROOT_PASSWORD}' < /tmp/setup-database.sql.bak > /tmp/setup-database.sql

# set execute permissions
chmod +x /tmp/setup-database.sql

# run daemon
mariadbd --user=mysql --init-file="/tmp/setup-database.sql"
