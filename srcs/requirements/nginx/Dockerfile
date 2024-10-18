FROM debian:bullseye

RUN apt update
RUN apt install -y\
    nginx \
    openssl

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443/tcp

CMD ["nginx", "-g", "daemon off;"]
