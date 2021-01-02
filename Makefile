SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/consul
	podman build -t defn/consul .

push: # Push defn/consul
	podman push defn/consul

pull : # Pull defn/consul
	docker pull defn/consul

bash: # Run bash shell with defn/consul
	docker run --rm -ti --entrypoint bash defn/consul

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

config: # Generate consul server config
	echo NODE_IP=$$(ip addr show tailscale0 | grep '/32' | awk '{print $$2}' | cut -d/ -f1) > .env

join: # Join consul cluster
	docker-compose exec consul consul join private.defn.sh
