SRC_DIR=srcs
BONUS_DIR=srcs/requirements/bonus
WORKING_DIR=$(BONUS_DIR)
# BONUS_FIILE=.bonus

# ifeq ($(shell test -e "srcs/docker-compose.yml"), 0)
# 	WORKING_DIR=$(BONUS_DIR)
# endif

ENV_FILE=$(WORKING_DIR)/.env
ENV_FILE_EXAMPLE=$(WORKING_DIR)/.env.example

all: setup build

bonus: set_bonus all

set_bonus:
	@touch $(BONUS_DIR)/$(BONUS_FIILE)

unset_bonus:
	@rm $(BONUS_DIR)/$(BONUS_FIILE)

setup: ssl env

run:
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml up -d

build:
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml up --build -d

ssl:
	@sudo bash $(SRC_DIR)/requirements/nginx/tools/generate-ssl.sh

env:
	@if [ ! -e $(ENV_FILE) ]; then cp $(ENV_FILE_EXAMPLE) $(ENV_FILE) ; fi

ps:
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml ps

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

down:
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml down

downv:
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml down -v

purge:
	@sudo docker system prune

fclean: purge
	@sudo docker compose --file $(WORKING_DIR)/docker-compose.yml down -v --rmi all

re: down all

ve: downv all

fe: fclean all
