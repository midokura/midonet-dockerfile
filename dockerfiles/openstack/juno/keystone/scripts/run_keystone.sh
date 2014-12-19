#!/bin/bash

# Load the passwords file
source /var/run/data/creds

OS_SERVICE_TOKEN=$(openssl rand -hex 10)
KEYSTONE_CONF_FILE=/etc/keystone/keystone.conf
IP=$(ip -4 a show dev eth0 | grep inet | awk '{print $2;}' | cut -d'/' -f1)

sed -i -e "s/<admin_token>/"$OS_SERVICE_TOKEN"/g" $KEYSTONE_CONF_FILE
sed -i -e "s/<keystone_password>/"$MYSQL_KEYSTONE"/g" $KEYSTONE_CONF_FILE

su -s /bin/sh -c "keystone-manage db_sync" keystone

exec keystone-all
