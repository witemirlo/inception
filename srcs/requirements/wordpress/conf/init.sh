#! /bin/sh

envsubst '${DATABASE_NAME} ${MARIADB_USER} ${MARIADB_USER_PASSWORD}' < /tmp/wp-config.php > /usr/share/webapps/wordpress/wp-config.php

wp core install \
--path="/usr/share/webapps/wordpress" \
--url="${DOMAIN_NAME}" \
--title="Get Inceptioned" \
--locale="ES" \
--admin_user="${MARIADB_USER}" \
--admin_password="${MARIADB_USER_PASSWORD}" \
--admin_email="jbedugo@student.42madrid.fr" \
--skip-email

php-fpm82 -F