#!/bin/bash

# Load the passwords file
source /var/run/data/passwords

GLANCE_CONF_FILE=/etc/glance/glance-api.conf

sed -i -e "s/<glance_db_password>/"$MYSQL_GLANCE"/g" $GLANCE_CONF_FILE
sed -i -e "s/<keystone_password>/"$SERVICE_GLANCE"/g" $GLANCE_CONF_FILE

su -s /bin/sh -c "glance-manage db_sync" glance

exec glance-registry &
exec glance-api
