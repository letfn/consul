SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: main # Build defn/consul
	docker build -t defn/consul .

main: # Build main
	go build -o main

push: # Push defn/consul
	docker push defn/consul

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

ci-go-test:
	/env.sh figlet -f /j/chunky.flf go
	/env.sh $(MAKE) test

test:
	go test
