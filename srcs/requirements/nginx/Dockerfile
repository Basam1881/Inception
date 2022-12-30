FROM debian:buster

# Install dependencies
RUN apt-get update && apt-get install -y \
    nginx\
    curl\
    net-tools\
    netcat\
    iputils-ping\
    openssl

RUN openssl req -x509 -nodes -days 365 -newkey \
    rsa:2048 -keyout key.pem -out certificate.pem \
    -subj '/CN=localhost/O=42AbuDhabi'
RUN    mv certificate.pem /etc/ssl/certs/certificate.pem
RUN    mv key.pem /etc/ssl/private/key.pem

# COPY certs/certificate.pem /etc/ssl/certs/certificate.pem
# COPY certs/key.pem /etc/ssl/private/key.pem

# Copy the NGINX configuration
COPY default.conf /etc/nginx/sites-enabled/default

# Copy the default site configuration
# COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the content for the default site
# COPY html/ /var/www/html/

WORKDIR /var/www/html

# Expose port 443 and run NGINX as a non-root user
EXPOSE 443
# USER nginx
CMD ["nginx", "-g", "daemon off;"]
