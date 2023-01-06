DOCKER_COMPOSE?=docker-compose

PHONY: \
	build_test_image \

build_test_image:
	docker-compose -f docker-compose.yml  run --rm postgres -d

test:
	go generate ./...
	docker-compose -f testdata/docker-compose.yml up --abort-on-container-exit --remove-orphans

test_fileoutput:
	go generate ./...
	docker-compose -f testdata/docker-compose.yml up --abort-on-container-exit --remove-orphans > testing.txt
