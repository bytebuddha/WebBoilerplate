#!make
include .env
export $(shell sed 's/=.*//' .env)

.DEFAULT_GOAL := help

build: ## Builds docker images from the current project files
	docker-compose build

development: ## Creates and starts the docker containers with development settings
	docker-compose -f docker/docker-compose.yml up -d
	docker-compose -f docker/docker-compose.yml ps

down: ## Stops and removes the docker containers
	docker-compose -f docker/docker-compose.yml down

prompt: ## Open a root shell in the application container
	docker exec -it $(CONTAINER_NAME) bash

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
