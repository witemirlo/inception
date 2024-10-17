FROM debian:bullseye

RUN apt update
RUN apt install nginx -y

# EXPOSE 443/tcp
# EXPOSE 80/tcp

CMD ["nginx", "-g", "daemon off;"]
