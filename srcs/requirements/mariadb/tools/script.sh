#!/bin/bash

MARIA_PASSWORD=$(cat /run/secrets/db_password)
MARIA_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

service mariadb start

sleep 10

mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIA_DATABASE" 
mariadb -e "CREATE USER IF NOT EXISTS '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PASSWORD'"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIA_DATABASE.* TO '$MARIA_USER'@'%'"
mariadb -e "FLUSH PRIVILEGES"

mysqladmin -u root -p"$MARIA_ROOT_PASSWORD" shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir=/var/lib/mysql
