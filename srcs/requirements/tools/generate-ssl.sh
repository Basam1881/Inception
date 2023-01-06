#!/bin/bash
# check if ../certs/key.pem and ../certs/certificate.pem exist
if [ -n "$1" ] && [ ! -f "$1/key.pem" ] || [ ! -f "$1/certificate.pem" ]; then
  # create ssl directory
  SRC_SSL_DIR="$1"
  mkdir -p ${SRC_SSL_DIR}

  # Generate src ssl certificate
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${SRC_SSL_DIR}/key.pem -out ${SRC_SSL_DIR}/certificate.pem -subj '/CN=localhost/O=42AbuDhabi' > /dev/null 2>&1
fi

if [ -n "$2" ] && [ ! -f "$2/key.pem" ] || [ ! -f "$2/certificate.pem" ]; then
  # create ssl directory
  BONUS_SSL_DIR="$2"
  mkdir -p ${BONUS_SSL_DIR}

  # Generate bonus ssl certificate
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${BONUS_SSL_DIR}/key.pem -out ${BONUS_SSL_DIR}/certificate.pem -subj '/CN=localhost/O=42AbuDhabi' > /dev/null 2>&1
fi