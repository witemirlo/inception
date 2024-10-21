# FROM debian:bullseye

# RUN apt update
# RUN apt install -y\
#     nginx \
#     openssl

# RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/jberdugo.crt -keyout /etc/nginx/jberdugo.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=jberdugo.42.fr"

# COPY conf/server.conf /etc/nginx/conf.d/
# COPY tools/index.html /var/www/html

# CMD ["nginx", "-g", "daemon off;"]

FROM alpine:3.19

RUN apk update
RUN apk add \
    nginx \
    openssl

RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/jberdugo.crt -keyout /etc/nginx/jberdugo.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=jberdugo.42.fr"

COPY conf/server.conf /etc/nginx/http.d/
COPY tools/index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]

