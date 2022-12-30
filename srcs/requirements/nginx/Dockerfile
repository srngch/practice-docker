FROM debian:buster-slim

LABEL maintainer="sarchoi <sarchoi@student.42seoul.kr>"

EXPOSE 80 443

RUN apt-get update \
	&& apt-get install -y \
	nginx \
	openssl

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=KO/ST=Seoul/O=42Seoul/CN=localhost" \
	-addext "subjectAltName=DNS:localhost" \
	-newkey rsa:2048 \
	-out /etc/ssl/private/inception.crt \
	-keyout /etc/ssl/private/inception.key;

COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
