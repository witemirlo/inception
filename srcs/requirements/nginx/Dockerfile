FROM debian:bullseye

RUN apt update && apt install nginx -y

# EXPOSE 443
# EXPOSE 80/tcp


CMD ["nginx", "-g", "daemon off;"]
