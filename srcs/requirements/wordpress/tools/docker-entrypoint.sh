#!/bin/bash

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wordpress/wp-config-sample.php ]; then
	echo "[ Downloading wordpress ]"
	wp core download \
		--path=/var/www/html/wordpress \
		--allow-root
fi
sleep 10;
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "[ Configuring wordpress ]"
	wp core config \
		--path=/var/www/html/wordpress \
		--allow-root \
		--dbname=$WORDPRESS_DB_NAME \
		--dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD \
		--dbhost=$WORDPRESS_DB_HOST \
		--dbprefix=wp_
fi

echo "[ Installing wordpress ]"
wp core install \
	--path=/var/www/html/wordpress \
	--allow-root \
	--url=$DOMAIN_NAME --title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USERNAME \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL

echo "[ Creating user ]"
wp user create \
	--path=/var/www/html/wordpress \
	--allow-root \
	$WP_USER_USERNAME \
	$WP_USER_EMAIL \
	--role=author \
	--user_pass=$WP_USER_PASSWORD

/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root
