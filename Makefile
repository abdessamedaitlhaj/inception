# Variables
COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = my_project

# Phony targets
.PHONY: all up down restart logs clean help

all: build

build:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up --build

up:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up

down:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v

restart: down up

stop:
	docker stop `docker ps -qa | tr '\n' ' '`

rmc:
	docker rm `docker ps -qa | tr '\n' ' '`

rmi:
	docker rmi `docker images -qa | tr '\n' ' '`

rmv:
	docker volume rm `docker volume ls -q | tr '\n' ' '`

rmn:
	docker network rm `docker network ls -q | tr '\n' ' '`


cache:
	docker system prune -af

logs:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

restart:
	sudo systemctl restart docker

clean: stop rmc rmi rmv rmn

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  up       Start the services"
	@echo "  down     Stop and remove the services"
	@echo "  restart  Restart the services"
	@echo "  logs     View logs of the services"
	@echo "  clean    Stop the services and clean up unused resources"
	@echo "  help     Display this help message"