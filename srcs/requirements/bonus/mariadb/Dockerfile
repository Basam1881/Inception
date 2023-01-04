FROM debian:buster

ARG MYSQL_DB_NAME
ARG MYSQL_USER_NAME
ARG MYSQL_USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# Install the necessary packages
RUN apt-get update && apt-get install -y mariadb-server

# Pass MariaDB conf
RUN sed -i '/^#port/s/^#//' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Pass sql file
COPY tools/setup-wpdb.sh /tmp
RUN chmod +x /tmp/setup-wpdb.sh

RUN service mysql start && /tmp/setup-wpdb.sh

# Expose the MariaDB port
EXPOSE 3306

# Start the MariaDB server
ENTRYPOINT [ "mysqld_safe" ]