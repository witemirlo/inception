FROM alpine:3.19

RUN apk update &&\
	apk add --no-cache\
	php82\
	php82-fpm\
	php82-cgi\
	php82-mysqli\
	fcgi\
	envsubst\
    shadow

RUN mkdir -p /usr/share/webapps/
RUN mkdir -p /var/www/localhost/htdocs/wordpress/

ADD https://wordpress.org/latest.tar.gz /usr/share/webapps/

RUN tar -xzf /usr/share/webapps/latest.tar.gz -C /usr/share/webapps/
RUN rm /usr/share/webapps/latest.tar.gz
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress/

RUN useradd www-data -g www-data
RUN chown -R www-data:www-data /usr/share/webapps

EXPOSE 3306
EXPOSE 9000

COPY conf/wp-config.php /tmp/
COPY conf/www.conf /etc/php82/php-fpm.d/

COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

# RUN adduser -D -g 'www' www
# RUN chown -R www:www /usr/share/webapps/wordpress

CMD ["./tmp/init.sh"]
