#generate ssl certificate
echo -e "\n\n\n\n\n\n\n\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out certificate.pem
echo
echo -e "\033[32m------------------ ssl files are successfully CREATED ------------------\033[0m"

# create ssl directory
SSL_DIR="../ssl"
mkdir -p ${SSL_DIR}

# mv ssl files
mv certificate.pem SSL/certificate.pem
if [ $? -ne 0 ]; then
  echo -e "\033[31m------------------ ssl files are NOT MOVED ------------------\033[0m"
  exit 1
fi
mv key.pem SSL/key.pem
if [ $? -ne 0 ]; then
  echo -e "\033[31m------------------ ssl files are NOT MOVED ------------------\033[0m"
  exit 1
else
  echo -e "\033[32m------------------ ssl files are successfully MOVED ------------------\033[0m"
fi
