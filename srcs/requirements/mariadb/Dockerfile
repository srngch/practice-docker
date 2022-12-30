FROM debian:buster-slim

LABEL maintainer="sarchoi <sarchoi@student.42seoul.kr>"

EXPOSE 3306

RUN apt-get update \
	&& apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chown mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf \
	&& chmod 600 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
