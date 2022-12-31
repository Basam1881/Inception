FROM debian:buster

# Install the necessary packages
RUN apt-get update && apt-get install -y mariadb-server

# Configure the MariaDB server
# RUN sed -i -e '/bind-address/s/127.0.0.1/0.<.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the MariaDB port
EXPOSE 3306

# Start the MariaDB server
CMD ["mysqld"]
