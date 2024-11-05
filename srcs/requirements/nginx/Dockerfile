FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    nginx\
    openssl\
    envsubst\
    shadow

# config file
COPY conf/server.conf /etc/nginx/http.d/

# init script
COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

# user www-data
RUN useradd www-data -g www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["./tmp/init.sh"]
