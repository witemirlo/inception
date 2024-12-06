FROM alpine:3.19

RUN apk update &&\
	apk add --no-cache\
	php82\
	php82-fpm\
	php82-cgi\
	php82-mysqli\
	php82-phar\
	php82-mbstring\
	php82-iconv\
	fcgi\
	envsubst\
    shadow

# directories for wordpress and php
RUN mkdir -p /usr/share/webapps
RUN mkdir -p /var/www/localhost/htdocs/wordpress
RUN mkdir -p /run/php

# user www-data
RUN useradd www-data -g www-data

# change permissions
RUN chown -R www-data:www-data /usr/share/webapps
RUN chown -R www-data:www-data /var/www/localhost/htdocs/wordpress
RUN chown -R www-data:www-data /run/php

# download wordpress
ADD https://wordpress.org/latest.tar.gz /usr/share/webapps/

# download wordpress-cli
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin

# wordpress install
RUN tar -xzf /usr/share/webapps/latest.tar.gz -C /usr/share/webapps/
RUN rm /usr/share/webapps/latest.tar.gz
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress/

# wordpress-cli install
RUN mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN chown www-data:www-data /usr/local/bin/wp

EXPOSE 3306
EXPOSE 9000

# config files
COPY conf/wp-config.php /tmp/
COPY conf/www.conf /etc/php82/php-fpm.d/

# init script
COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

CMD ["./tmp/init.sh"]
