#generate ssl certificate
echo -e "\n\n\n\n\n\n\n\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out certificate.pem
echo

# check if first argument is passed
if [ "$1" ]
then
  mv certificate.pem $1/certificate.pem
  mv key.pem $1/key.pem
fi
