COMPOSE_FILE = srcs/docker-compose.yml
WORDPRESS_PATH = "/home/aait-lha/data/wordpress"
MARIADB_PATH = "/home/aait-lha/data/mariadb"
RM = rm -rf
GREEN  = \033[0;32m
NC     = \033[0m

all: up

up:
	@echo "$(GREEN)Building and starting services with Docker Compose...$(NC)"
	@mkdir -p ${WORDPRESS_PATH}
	@mkdir -p ${MARIADB_PATH}
	@docker compose -f $(COMPOSE_FILE) up --build

start:
	@echo "$(GREEN)Starting services without rebuilding...$(NC)"
	@docker compose -f $(COMPOSE_FILE) start

stop:
	@echo "$(GREEN)Stopping all running containers...$(NC)"
	@docker compose -f $(COMPOSE_FILE) stop

logs:
	@echo "$(GREEN)Displaying Docker Compose logs...$(NC)"
	@docker compose -f $(COMPOSE_FILE) logs

down:
	@echo "$(GREEN)Stop & drop all containers, networks, and volumes...$(NC)"
	@${RM} ${WORDPRESS_PATH}
	@${RM} ${MARIADB_PATH}
	@docker compose -f $(COMPOSE_FILE) down

help:
	@echo "$(BOLD)Usage: make [target]$(NC)"
	@echo "$(GREEN)up$(NC)        - Start the services"
	@echo "$(GREEN)logs$(NC)      - View logs of the services"
	@echo "$(GREEN)stop$(NC)      - Stop all containers"
	@echo "$(GREEN)start$(NC)     - Start again all containers"
	@echo "$(GREEN)down$(NC)     - Stop everything and remove Docker data"
	@echo "$(GREEN)help$(NC)      - Show this help message"
