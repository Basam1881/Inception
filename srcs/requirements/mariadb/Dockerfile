FROM debian:buster

ARG MYSQL_DB_NAME
ARG MYSQL_USER_NAME
ARG MYSQL_USER_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# Install the necessary packages
RUN apt-get update && apt-get install -y mariadb-server \
  && rm -rf /var/lib/apt/lists/*

# Pass MariaDB conf
RUN sed -i '/^#port/s/^#//' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Pass sql file
COPY tools/wordpress.sql /tmp
RUN chmod +x /tmp/wordpress.sql

RUN service mysql start && mysql < /tmp/wordpress.sql

# Expose the MariaDB port
EXPOSE 3306

# Start the MariaDB server
ENTRYPOINT [ "mysqld_safe" ]