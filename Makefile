all: ssl build

run:
	@sudo docker compose --file srcs/docker-compose.yml up -d

build:
	@sudo docker compose --file srcs/docker-compose.yml up --build -d

ssl:
	@sudo bash srcs/requirements/nginx/tools/generate-ssl.sh

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
	@if sudo docker images --all | grep -q '<none>'; then \
		sudo docker rmi -f $(sudo docker images -f "dangling=true" -q); \
	fi

fclean: purge
	@sudo docker compose --file srcs/docker-compose.yml down -v --rmi all

re: down all

ve: downv all

fe: fclean all