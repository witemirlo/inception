FROM alpine:3.19

RUN apk add nginx

# COPY conf/server /etc/nginx/sites-availabre/server
COPY tools/index.html /usr/share/nginx/html

# EXPOSE 443
# EXPOSE 80/tcp


CMD ["nginx", "-g", "daemon off;"]
