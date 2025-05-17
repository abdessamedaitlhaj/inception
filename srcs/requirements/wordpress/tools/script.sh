#!/bin/bash

WP_DB_PASSWORD=$(cat /run/secrets/db_password)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)

curl -O -s https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf

WP_PATH='/var/www/wordpress'
mkdir -p "$WP_PATH"
chmod 755 "$WP_PATH"

wp core download --path="$WP_PATH" --allow-root

mv "$WP_PATH/wp-config-sample.php" "$WP_PATH/wp-config.php"

wp config set DB_NAME "$WP_DB_NAME" --path="$WP_PATH" --allow-root
wp config set DB_USER "$WP_DB_USER" --path="$WP_PATH" --allow-root
wp config set DB_PASSWORD "$WP_DB_PASSWORD" --path="$WP_PATH" --allow-root
wp config set DB_HOST "$WP_DB_HOST" --path="$WP_PATH" --allow-root

wp config set WP_REDIS_HOST "redis" --allow-root --path="$WP_PATH"
wp config set WP_REDIS_PORT "6379" --allow-root --path="$WP_PATH"

wp core install	--url="$DOMAINE_NAME" --title="$TITLE" \
				--admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" \
				--admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root
        
wp user create	"$WP_USER" "$WP_USER_EMAIL" --role="$WP_USER_ROLE" \
					--user_pass="$WP_USER_PASSWORD" --path="$WP_PATH" --allow-root

wp plugin install redis-cache --activate --allow-root --path="$WP_PATH"
wp redis enable --allow-root --path="$WP_PATH"

wp theme install twentyseventeen --activate --allow-root --path="$WP_PATH"

chown -R www-data:www-data "$WP_PATH"

exec /usr/sbin/php-fpm7.4 -F