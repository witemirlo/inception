all:
	docker compose --project-directory srcs/ up --detach

clean:
	docker compose --project-directory srcs/ down --rmi all
	docker container prune --force
	docker image prune --force

fclean: clean

re: clean all

.PHONY: all clean fclean re