SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/consul
	podman build -t defn/consul .

push: # Push defn/consul
	podman push defn/consul

bash: # Run bash shell with defn/consul
	podman run --rm -ti --entrypoint bash defn/consul

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

logs:
	docker-compose logs -f
