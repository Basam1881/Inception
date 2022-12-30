FROM debian:buster

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    php-fpm\
    php-mysql\
    tini

RUN mkdir -p /run/php

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress/* /var/www/html && \
    rm -rf wordpress

# Configure PHP-FPM
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

WORKDIR /var/www/html

RUN cp wp-config-sample.php wp-config.php && \
    sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php && \
    sed -i "s/username_here/wordpress/g" /var/www/html/wp-config.php && \
    sed -i "s/password_here/wordpress/g" /var/www/html/wp-config.php && \
    sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php

# Expose the default PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
ENTRYPOINT ["tini", "--"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
