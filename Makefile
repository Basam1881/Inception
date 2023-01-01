SRC_DIR="srcs/"
ENV_FILE=$(SRC_DIR)/.env
ENV_FILE_EXAMPLE=$(SRC_DIR)/.env.example

all: ssl build

setup: ssl env

run:
	@sudo docker compose --file srcs/docker-compose.yml up -d

build:
	@sudo docker compose --file srcs/docker-compose.yml up --build -d

ssl:
	@sudo bash srcs/requirements/nginx/tools/generate-ssl.sh

env:
	@if [ ! -e $(ENV_FILE) ]; then cp $(ENV_FILE_EXAMPLE) $(ENV_FILE) ; fi

ps:
	@sudo docker compose --file srcs/docker-compose.yml ps

bashn:
	@sudo docker exec -it mynginx bash

bashw:
	@sudo docker exec -it mywordpress bash

bashm:
	@sudo docker exec -it mymariadb bash

down:
	@sudo docker compose --file srcs/docker-compose.yml down

downv:
	@sudo docker compose --file srcs/docker-compose.yml down -v

purge:
	@sudo docker system prune

fclean: purge
	@sudo docker compose --file srcs/docker-compose.yml down -v --rmi all

re: down all

ve: downv all

fe: fclean all