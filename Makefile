CONT=

.PHONY: all clean fclean re rebuild

all:
	$(shell if [ ! -d /home/$(shell whoami)/data ]; then mkdir /home/$(shell whoami)/data; fi)
	docker compose --file srcs/docker-compose.yml up --detach
	docker compose --file srcs/docker-compose.yml start

clean:
	docker compose --file srcs/docker-compose.yml down --rmi all
	docker system prune -a --force
# ./clean.sh

fclean: clean

re: clean all

rebuild:
	docker compose --file srcs/docker-compose.yml build

ps:
	docker compose --file srcs/docker-compose.yml ps -a

down:
	docker compose --file srcs/docker-compose.yml down --rmi all

logs:
	docker compose -f srcs/docker-compose.yml logs ${CONT}
