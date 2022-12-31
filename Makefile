all: ssl build

run:
	@sudo docker compose --file srcs/docker-compose.yml up -d

build:
	@sudo docker compose --file srcs/docker-compose.yml up --build -d

ssl:
	@sudo bash srcs/requirements/nginx/tools/generate-ssl.sh

ps:
	@sudo docker compose --file srcs/docker-compose.yml ps

down:
	@sudo docker compose --file srcs/docker-compose.yml down

downv:
	@sudo docker compose --file srcs/docker-compose.yml down -v

fclean:
	@sudo docker compose --file srcs/docker-compose.yml down -v --rmi all
	@if sudo docker images --all | grep -q '<none>'; then \
		docker rmi -f $(docker images -f "dangling=true" -q); \
	fi
ve: downv all

re: fclean all