#! /bin/sh

container()
{
    printf "Deleting containers ..."
    if [ $(docker container ls -aq | wc -l) -ne "0"  ]; then
	    docker rm -vf $(docker ps -aq) --force > /dev/null &&\
	    docker container prune --force > /dev/null &&\
        printf "\033[32m done\033[0m\n"  ||\
        printf "\033[31mfail\033[0m\n"
    else
	    docker container prune --force > /dev/null  &&\
        printf "\033[32m done\033[0m\n" ||\
        printf "\033[31mfail\033[0m\n"
    fi
}

image()
{
    printf "Deleting images     ..."
    if [ $(docker image ls -aq | wc -l) -ne "0" ]; then
	    docker rmi -f $(docker images -a -q) --force > /dev/null  &&\
	    docker image prune --force > /dev/null  &&\
        printf "\033[32m done\033[0m\n" ||\
        printf "\033[31mfail\033[0m\n"
    else
	    docker image prune --force > /dev/null  &&\
        printf "\033[32m done\033[0m\n" ||\
        printf "\033[31mfail\033[0m\n"
    fi
}

volume()
{
    printf "Deleting volumes    ..."
    if [ $(docker volume ls -q | wc -l) -ne "0" ]; then
	    docker volume rm -f $(docker volume -q | tr "\n" " ") --force > /dev/null  &&\
	    docker volume prune --force > /dev/null  &&\
        printf "\033[32m done\033[0m\n" ||\
        printf "\033[31mfail\033[0m\n"
    else
	    docker volume prune --force > /dev/null  &&\
        printf "\033[32m done\033[0m\n" ||\
        printf "\033[31mfail\033[0m\n"
    fi
}


main()
{
    container
    image
    volume
}

main