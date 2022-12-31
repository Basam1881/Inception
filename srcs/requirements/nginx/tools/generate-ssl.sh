# check if ../certs/key.pem and ../certs/certificate.pem exist
if [ ! -f "../certs/key.pem" ] && [ ! -f "../certs/certificate.pem" ]; then
  # create ssl directory
  SSL_DIR="../certs"
  mkdir -p ${SSL_DIR}

  #generate ssl certificate
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${SSL_DIR}/key.pem -out ${SSL_DIR}/certificate.pem -subj '/CN=localhost/O=42AbuDhabi'
fi
