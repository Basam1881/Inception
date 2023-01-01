
#!/bin/bash

#start mariadb
service mysql start 

#set root password
# mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

# mysql << EOF
# CREATE DATABASE $MYSQL_DB_NAME;
# CREATE USER '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
# GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER_NAME'@'%';
# FLUSH PRIVILEGES;
# EOF

mysql << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
EOF

exec $@