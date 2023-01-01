FROM debian:buster

# Install the necessary packages
RUN apt-get update && apt-get install -y mariadb-server \
  tini \
  && rm -rf /var/lib/apt/lists/*

# Pass MariaDB conf
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d

# Pass setup script
COPY tools/setup-mariadb.sh /tmp
RUN chmod +x /tmp/setup-mariadb.sh

# Pass sql script
COPY tools/create-wpdb.sql /tmp
RUN chmod +x /tmp/create-wpdb.sql

RUN service mysql start && mysql < /tmp/create-wpdb.sql

# Expose the MariaDB port
EXPOSE 3306

# Start the MariaDB server
ENTRYPOINT [ "tini", "--" ]
CMD [ "mysqld_safe"]
