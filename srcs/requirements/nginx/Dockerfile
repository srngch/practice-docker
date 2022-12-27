# base image
FROM debian:buster-slim

# metadata
LABEL maintainer="sarchoi <sarchoi@student.42seoul.kr>"

# shell scripts
RUN apt-get update && apt-get install -y nginx openssl
		# && apt-get clean

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=KO/ST=Seoul/O=42Seoul/CN=localhost" \
	-addext "subjectAltName=DNS:localhost" \
	-newkey rsa:2048 \
	-out /etc/ssl/private/inception.crt \
	-keyout /etc/ssl/private/inception.key;

# copy from host to container
COPY ./conf/default /etc/nginx/sites-enabled/default

# port
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
