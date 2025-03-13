# Variables
COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = my_project

# Phony targets
.PHONY: all up down restart logs clean help

# Default target
all: build

# Start the services
build:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up --build

up:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up

# Stop and remove the services
down:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v
rmi:
	docker rmi $(docker images -qa)

# Restart the services
restart: down up

rmm:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null


cache:
	docker system prune -af

# View logs of the services
logs:
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

restart:
	sudo systemctl restart docker


# Clean up unused resources
clean: down
	@echo "Cleaning up unused Docker resources..."
	# Remove stopped containers, unused networks, and volumes
	docker system prune -f --volumes
	# Remove all unused images (not just dangling ones)
	docker image prune -af
	# Optional: Remove unused build cache
	docker builder prune -f
	@echo "Docker cleanup completed."


# Display help message
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