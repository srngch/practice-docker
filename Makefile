NAME = inception

YML = ./srcs/docker-compose.yml
DOCKER_COMPOSE = docker compose --file $(YML)

# HELP
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: build
build: ## Build containers
	$(DOCKER_COMPOSE) build

.PHONY: up
up: # Create and start containers
	$(DOCKER_COMPOSE) up -d

.PHONY: down
down: # Stop and remove containers, networks
	$(DOCKER_COMPOSE) down

.PHONE: start
start: ## Start services
ifeq ($(shell $(DOCKER_COMPOSE) ps --services | wc -l | tr -d ' '), 1)
	$(info No containers running)
else
	$(DOCKER_COMPOSE) start
endif

.PHONY: stop
stop: ## Stop running containers
	$(DOCKER_COMPOSE) stop

.PHONY: rm
rm: # Removes stopped service containers
	$(DOCKER_COMPOSE) rm

.PHONY: show
show: ## Show containers, images, and logs
	@echo "<Running projects>"
	@$(DOCKER_COMPOSE) ps
	@echo "\n<Images>"
	@$(DOCKER_COMPOSE) images
	@echo "\n<Logs>"
	@$(DOCKER_COMPOSE) logs

.PHONY: clean
clean: ## Stop and remove running containers, networks, images, and volumes
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

.PHONY: re
re: clean
	make build
