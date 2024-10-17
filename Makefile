all:
	docker-compose --project-directory srcs/ up --detach
	@echo 
	docker-compose --project-directory srcs/ run --detach nginx

clean:
	docker-compose --project-directory srcs/ down --rmi all
	@echo 
	./clean.sh
	@echo 

fclean: clean

re: clean all

.PHONY: all clean fclean re