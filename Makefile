.PHONY: build

SHELL := /bin/bash
IMAGENAME=wagtail_grapple
WAGTAIL_VERSION=2.15.2
GH_ORG=cividi

build: ## Build the Docker images
	docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/$(GH_ORG)/$(IMAGENAME):latest -t ghcr.io/$(GH_ORG)/$(IMAGENAME):$(WAGTAIL_VERSION) --push ./django
	# docker-compose -p wagtail_grapple build

build-dev:
	docker buildx build --build-arg ENVIRONMENT=dev --platform linux/amd64,linux/arm64 -t ghcr.io/$(GH_ORG)/$(IMAGENAME):dev --push ./django

up: ## Bring the  Docker containers up
	docker-compose -p wagtail_grapple up -d || echo 'Already up!'

upwin:  ## Bring the Docker container up for bash on ubuntu folk
	export WINDIR="$(subst /mnt/c,//c,$(CURDIR))/" && make up

lint: build ## Lint the python code.
	docker run -v $(CURDIR)/django:/app $(IMAGENAME) /bin/bash -c 'flake8 website'

down: ## Stop the backend Docker container
	docker-compose -p wagtail_grapple stop

enter: ## Enter backend container
	docker exec -it $(IMAGENAME) /bin/bash

clean: ## Stop and remove all Docker containers
	docker-compose down

destroy: ## Remove all our Docker images
	docker rmi -f $(IMAGENAME)

refresh: clean up enter
	## Let's start again
