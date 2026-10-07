#!/usr/bin/env bash
# scripts/02_configure_lamp.sh
# Configure LAMP stack services and test page
set -xeu

cp -vf /vagrant/files/info.php /var/www/html/info.php

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

systemctl enable --now apache2
systemctl enable --now mariadb
