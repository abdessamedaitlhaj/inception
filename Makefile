COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = my_project

GREEN  = \033[0;32m
NC     = \033[0m

all: build

build:
	@echo "$(GREEN)Building and starting services with Docker Compose...$(NC)"
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up --build

up:
	@echo "$(GREEN)Starting services without rebuilding...$(NC)
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up

stop:
	@echo "$(GREEN)Stopping all running containers...$(NC)"
	docker stop $$(docker ps -qa)

rmc:
	@echo "$(GREEN)Removing all stopped containers...$(NC)"
	docker rm $$(docker ps -qa)

rmi:
	@echo "$(GREEN)Removing all Docker images...$(NC)"
	docker rmi -f $$(docker images -qa)

rmv:
	@echo "$(GREEN),Removing all Docker volumes...$(NC)"
	docker volume rm $$(docker volume ls -q)

rmn:
	@echo "$(GREEN),Removing all Docker networks...$(NC)"
	docker network rm $$(docker network ls -q)

logs:
	@echo "$(GREEN),Displaying Docker Compose logs...$(NC)"
	docker compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs -f

clean: stop rmc rmi rmv rmn

help:
	@echo "$(BOLD)Usage: make [target]$(NC)"
	@echo "$(GREEN)up$(NC)        - Start the services"
	@echo "$(GREEN)build$(NC)     - Build and start the services"
	@echo "$(GREEN)logs$(NC)      - View logs of the services"
	@echo "$(GREEN)stop$(NC)      - Stop all containers"
	@echo "$(GREEN)rmc$(NC)       - Remove all containers"
	@echo "$(GREEN)rmi$(NC)       - Remove all images"
	@echo "$(GREEN)rmv$(NC)       - Remove all volumes"
	@echo "$(GREEN)rmn$(NC)       - Remove all networks"
	@echo "$(GREEN)clean$(NC)     - Stop everything and remove Docker data"
	@echo "$(GREEN)help$(NC)      - Show this help message"
