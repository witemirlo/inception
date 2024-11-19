#! /bin/sh

# expand enviroment variables and save it in the correct file
envsubst '${DATABASE_NAME} ${MARIADB_USER} ${MARIADB_USER_PASSWORD}' < /tmp/wp-config.php > /usr/share/webapps/wordpress/wp-config.php

# auto install wordpress
wp core install \
--path="/usr/share/webapps/wordpress" \
--url="${DOMAIN_NAME}" \
--title="Get Inceptioned" \
--locale="ES" \
--admin_user="${WORDPRESS_ADMIN}" \
--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
--admin_email="jberdugo@student.42madrid.fr" \
--skip-email

wp user create \
"${WORDPRESS_USER}" \
"jberdugo@student.42madrid.es" \
--user_pass="${WORDPRESS_USER_PASSWORD}" \
--path="/usr/share/webapps/wordpress"

# run php fastcgi daemon
php-fpm82 -F
