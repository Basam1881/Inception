FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl\
  mariadb-client\
  nginx\
  php-fpm\
  wget\
  && rm -rf /var/lib/apt/lists/*

# install wordpress
RUN mkdir -p /var/www/html
RUN wget -q0- https://wordpress.org/latest.tar.gz | tar -xzC /var/www/html --strip-components=1

# configure php-fpm
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini<