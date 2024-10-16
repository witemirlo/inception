FROM alpine:3.19

RUN apk add nginx

# COPY conf/server /etc/nginx/sites-availabre/server

# maybe delete
EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
