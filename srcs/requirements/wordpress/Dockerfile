FROM alpine:3.19

# RUN apk update &&\
# 	apk add --no-cache\
# 	curl

RUN mkdir -p /usr/share/webapps/

ADD https://wordpress.org/latest.tar.gz /usr/share/webapps/

RUN tar -xzf /usr/share/webapps/latest.tar.gz -C /usr/share/webapps/
RUN rm /usr/share/webapps/latest.tar.gz

CMD ["tail", "-f"]