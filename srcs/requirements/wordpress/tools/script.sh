#!/bin/bash

WP_DB_PASSWORD=$(cat /run/secrets/db_password)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)

if [ -f "/var/www/html/wp-config.php" ]; then
	exec php-fpm7.4 -F
fi

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WP_PATH='/var/www/html'
mkdir -p "$WP_PATH"
chmod 777 "$WP_PATH"

wp core download --path="$WP_PATH" --allow-root

wp config create \
  --dbname="$WP_DB_NAME" \
  --dbuser="$WP_DB_USER" \
  --dbpass="$WP_DB_PASSWORD" \
  --dbhost="$WP_DB_HOST" \
  --path="$WP_PATH" \
  --allow-root \
  --force

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

exec php-fpm7.4 -F