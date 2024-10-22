#! /bin/sh

mv /etc/nginx/http.d/server.conf /etc/nginx/http.d/server.conf.bak
envsubst < /etc/nginx/http.d/server.conf.bak > /etc/nginx/http.d/server.conf

openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/${NGINX_CERT} -keyout /etc/nginx/${NGINX_CERT_KEY} -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=jberdugo.42.fr"

nginx -g "daemon off;"