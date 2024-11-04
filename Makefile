CONT=

.PHONY: all clean fclean re ps down logs

all:
	$(shell if [ ! -d /home/$(shell whoami)/data ]; then mkdir /home/$(shell whoami)/data; fi)
	$(shell if [ ! -d /home/$(shell whoami)/data/db ]; then mkdir /home/$(shell whoami)/data/db; fi)
	$(shell if [ ! -d /home/$(shell whoami)/data/wp ]; then mkdir /home/$(shell whoami)/data/wp; fi)
	docker compose --file srcs/docker-compose.yml build
	docker compose --file srcs/docker-compose.yml up --detach
	docker compose --file srcs/docker-compose.yml start

clean: down

fclean: clean
	docker system prune -a --force

re: clean all

ps:
	docker compose --file srcs/docker-compose.yml ps -a

down:
	docker compose --file srcs/docker-compose.yml down --rmi all

logs:
	docker compose -f srcs/docker-compose.yml logs ${CONT}
