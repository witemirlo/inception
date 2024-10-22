CONT=

.PHONY: all clean fclean re rebuild

all:
	docker-compose --file srcs/docker-compose.yml up --detach
	@echo 
	docker-compose --file srcs/docker-compose.yml start

clean:
	docker-compose --file srcs/docker-compose.yml down --rmi all
	@echo 
	./clean.sh
	@echo 

fclean: clean

re: clean all

rebuild:
	docker-compose --file srcs/docker-compose.yml build

ps:
	docker-compose --file srcs/docker-compose.yml ps -a

down:
	docker-compose --file srcs/docker-compose.yml down --rmi all

logs:
	docker compose -f srcs/docker-compose.yml logs ${CONT}
