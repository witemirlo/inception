FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    nginx\
    openssl\
    envsubst\
    shadow

COPY conf/server.conf /etc/nginx/http.d/
# COPY tools/index.html /var/www/html/

COPY conf/init.sh /tmp/
RUN chmod +x /tmp/init.sh

# RUN adduser -D -g 'www' www
RUN useradd www-data -g www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["./tmp/init.sh"]
