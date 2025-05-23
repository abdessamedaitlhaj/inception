#!/bin/bash

MARIA_PASSWORD=$(cat /run/secrets/db_password)
MARIA_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

# Start MariaDB in background for initialization
service mariadb start

# Wait for MariaDB to be ready
while ! mysqladmin ping --silent; do
    sleep 1
done

# Set root password if not already set
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_ROOT_PASSWORD';"

# Create database and user
mysql -u root -p"$MARIA_ROOT_PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS $MARIA_DATABASE;
CREATE USER IF NOT EXISTS $MARIA_USER@'%' IDENTIFIED BY $MARIA_PASSWORD;
GRANT ALL PRIVILEGES ON $MARIA_DATABASE.* TO $MARIA_USER@'%';
FLUSH PRIVILEGES;
EOF

# Shutdown the background MariaDB process
mysqladmin -u root -p"$MARIA_ROOT_PASSWORD" shutdown

# Wait for shutdown
sleep 2

# Start MariaDB in foreground for production
exec mysqld_safe --port=3306 --bind-address=0.0.0.0
