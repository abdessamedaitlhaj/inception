#!/bin/bash

service mariadb start

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIA_DATABASE" 
mariadb -e "CREATE USER IF NOT EXISTS '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PASSWORD'"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIA_DATABASE.* TO '$MARIA_USER'@'%'"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"

mysqladmin -u root -p"$MARIA_ROOT_PASSWORD" shutdown

exec mysqld_safe --bind_address=0.0.0.0
