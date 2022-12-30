FROM debian:buster-slim

LABEL maintainer="sarchoi <sarchoi@student.42seoul.kr>"

EXPOSE 9000

RUN apt-get update \
	&& apt-get install -y \
		mariadb-client \
		php7.3 \
		php7.3-curl \
		php7.3-fpm \
		php7.3-gd \
		php7.3-intl \
		php7.3-mbstring \
		php7.3-mysql \
		php7.3-soap \
		php7.3-xml \
		php7.3-xmlrpc \
		php7.3-zip \
		sendmail \
		wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp \
	&& chmod +x /tmp/wp-cli.phar \
	&& mv /tmp/wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/php.ini /etc/php/7.3/fpm/php.ini

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD ["/usr/local/bin/docker-entrypoint.sh"]
