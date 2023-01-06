SRC_DIR=srcs
BONUS_DIR=srcs/requirements/bonus
TOOLS_DIR=srcs/requirements/tools
ENV_FILE=.env
ENV_FILE_EXAMPLE=.env.example
USERNAME=bnaji

## mandatory rules ##

all: setup build

run:
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml up -d

build:
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml up --build -d

ps:
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml ps

down:
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml down

downv:
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml down -v

fclean: purge
	@sudo docker compose --file $(SRC_DIR)/docker-compose.yml down -v --rmi all

re: down all

ve: downv all

fe: fclean all


## bonus rules ##

bonus: setup build-b

run-b:
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml up -d

build-b:
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml up --build -d

ps-b:
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml ps

down-b:
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml down

downv-b:
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml down -v

fclean-b: purge
	@sudo docker compose --file $(BONUS_DIR)/docker-compose.yml down -v --rmi all

re-b: down-b bonus

ve-b: downv-b bonus

fe-b: fclean-b bonus


## common rules ##

setup: ssl env vol host

ssl:
	@chmod +x $(TOOLS_DIR)/generate-ssl.sh
	@sudo bash $(TOOLS_DIR)/generate-ssl.sh $(SRC_DIR)/requirements/nginx/certs $(BONUS_DIR)/nginx/certs

env:
	@if [ ! -e $(SRC_DIR)/$(ENV_FILE) ]; then cp $(SRC_DIR)/$(ENV_FILE_EXAMPLE) $(SRC_DIR)/$(ENV_FILE) ; fi
	@if [ ! -e $(BONUS_DIR)/$(ENV_FILE) ]; then cp $(BONUS_DIR)/$(ENV_FILE_EXAMPLE) $(BONUS_DIR)/$(ENV_FILE) ; fi

vol:
	@mkdir -p /home/${USERNAME}/data/wp
	@mkdir -p /home/${USERNAME}/data/sql
	@mkdir -p /home/${USERNAME}/data/bonus
	@mkdir -p /home/${USERNAME}/data/bonus/wp
	@mkdir -p /home/${USERNAME}/data/bonus/sql

host:
	@chmod +x $(TOOLS_DIR)/add-hosts-entry.sh
	@sudo bash $(TOOLS_DIR)/add-hosts-entry.sh

bashn:
	@sudo docker exec -it mynginx bash

bashw:
	@sudo docker exec -it mywordpress bash

bashm:
	@sudo docker exec -it mymariadb bash

basha:
	@sudo docker exec -it myadminer bash

bashp:
	@sudo docker exec -it myportfolio bash

bashf:
	@sudo docker exec -it myftp bash

bashr:
	@sudo docker exec -it myredis bash

basht:
	@sudo docker exec -it mytor bash

purge:
	@sudo docker system prune
