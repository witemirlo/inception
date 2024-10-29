#! /bin/sh

envsubst '${DATABASE_NAME} ${LOGIN} ${MYSQL_USER_PASSWORD} ${MYSQL_DATABASE}' < /tmp/wp-config.php > /usr/share/webapps/wordpress/wp-config.php

# php
tail -f