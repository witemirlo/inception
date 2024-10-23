FROM alpine:3.19

RUN apk update &&\
    apk add --no-cache\
    nginx\
    openssl\
    envsubst

# RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/${NGINX_CERT} -keyout /etc/nginx/${NGINX_CERT_KEY} -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=jberdugo.42.fr"

COPY conf/server.conf /etc/nginx/http.d/
COPY tools/index.html /var/www/html/
COPY conf/init.sh /tmp/

RUN chmod +x /tmp/init.sh

CMD [ "./tmp/init.sh" ]


