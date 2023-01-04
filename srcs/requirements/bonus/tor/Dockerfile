FROM debian:buster

RUN apt-get update && apt-get install -y \
  tor \
  curl

RUN echo "curl --socks5-hostname localhost:9050 https://check.torproject.org/" \
  > /tmp/test_connection.sh && chmod +x /tmp/test_connection.sh

EXPOSE 9050

ENTRYPOINT ["tor"]
