#! /bin/sh

# create backup file
mv /etc/nginx/http.d/server.conf /etc/nginx/http.d/server.conf.bak

# expand enviroment variables and save it in the correct file
envsubst '${DOMAIN_NAME} ${NGINX_CERT} ${NGINX_CERT_KEY}' < /etc/nginx/http.d/server.conf.bak > /etc/nginx/http.d/server.conf

# create certificate and certificate key
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/${NGINX_CERT} -keyout /etc/nginx/${NGINX_CERT_KEY} -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=jberdugo.42.fr"

# run nginx
nginx -g "daemon off;"