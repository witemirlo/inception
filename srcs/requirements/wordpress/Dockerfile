FROM alpine:3.19

RUN apk update &&\
	apk add --no-cache\
	php\
	php-fpm\
	mariadb-client\
	envsubst

RUN mkdir -p /usr/share/webapps/
RUN mkdir -p /var/www/localhost/htdocs/wordpress/

ADD https://wordpress.org/latest.tar.gz /usr/share/webapps/

RUN tar -xzf /usr/share/webapps/latest.tar.gz -C /usr/share/webapps/
RUN rm /usr/share/webapps/latest.tar.gz

RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress/

EXPOSE 3306
EXPOSE 9000

COPY conf/wp-config.php /tmp/
COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

CMD ["./tmp/init.sh"]
