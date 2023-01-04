

# check if wordpress database already exists from wp-config.php
cat wp-config.php | grep "database_name_here"
if ! [ "$?" -ne "0" ]
then
  # setup wordpress database
  sed -i "s/database_name_here/$MYSQL_DB_NAME/g" /var/www/html/wp-config.php
  sed -i "s/username_here/$MYSQL_USER_NAME/g" /var/www/html/wp-config.php
  sed -i "s/password_here/$MYSQL_USER_PASSWORD/g" /var/www/html/wp-config.php
  sed -i "s/localhost/$WORDPRESS_DB_HOST/g" /var/www/html/wp-config.php


  # install wordpress with wp-cli
  sudo -u www-data wp core install --url=$WEBSITE_URI --title=$TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL
  sudo -u www-data wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_USER_PASSWORD} --role=author
  sudo -u www-data wp theme install raft --activate

  ### bonus ###

  # install redis object cache
  sudo -u www-data wp config set WP_REDIS_HOST redis
  sudo -u www-data wp config set WP_REDIS_PORT 6379
  sudo -u www-data wp config set WP_CACHE_KEY_SALT "$WEBSITE_URI"
  sudo -u www-data wp config set WP_REDIS_CLIENT "wp-redis"
  sudo -u www-data wp config set FS_METHOD "direct"
  sudo -u www-data wp plugin install redis-cache --activate
  sudo -u www-data wp redis enable

  # install query monitor
  sudo -u www-data wp plugin install query-monitor --activate

fi


