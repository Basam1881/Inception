#!/bin/bash
if [ -f /usr/share/adminer/adminer.php ];
then
  mkdir -p /var/www/html/adminer && \
  mv /usr/share/adminer/adminer.php /var/www/html/adminer && \
  mv /var/www/html/adminer/adminer.php /var/www/html/adminer/index.php
fi