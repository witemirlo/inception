#! /bin/sh

envsubst < /tmp/wp-config.php > /usr/share/webapps/wordpress/wp-config.php

tail -f