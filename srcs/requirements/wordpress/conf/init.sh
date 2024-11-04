#! /bin/sh

envsubst '${DATABASE_NAME} ${MARIADB_USER} ${MARIADB_USER_PASSWORD}' < /tmp/wp-config.php > /usr/share/webapps/wordpress/wp-config.php

php-fpm82 -F