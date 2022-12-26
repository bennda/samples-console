# makefile variables
IMAGE_NAME=dnbnt/samples-console
IMAGE_VERSION=1.0
IMAGE_FULLNAME=${IMAGE_NAME}:${IMAGE_VERSION}

.PHONY: help all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo "bash-build"
		@echo "bash-test"
		@echo "bash"
		@echo "build"
		@echo "test"
	    @echo "all"

.DEFAULT_GOAL := all

bash-build:
		@echo "\n===== docker build: bash"
		@docker build --no-cache --pull --build-arg BASE_IMAGE=alpine --build-arg BASE_VERSION=3.17.0 -t "${IMAGE_FULLNAME}-bash" ./bash

bash-test:
		@echo "\n===== test: bash"; \
		export ECHO="$(shell docker run --rm "${IMAGE_FULLNAME}-bash" -text "hello bash")"; \
		export RAND="$(shell docker run --rm "${IMAGE_FULLNAME}-bash" -mode random)"; \
		echo "echo: $$ECHO"; \
		echo "rand: $$RAND"

bash:	bash-build bash-test

go-build:
		@echo "\n===== docker build: go"
		@docker build --no-cache --pull --build-arg BASE_IMAGE=golang --build-arg BASE_VERSION=1.19.4-alpine3.17 -t "${IMAGE_FULLNAME}-go" ./go

go-test:
		@echo "\n===== test: go"; \
		export ECHO="$(shell docker run --rm "${IMAGE_FULLNAME}-go" -text "hello go")"; \
		export RAND="$(shell docker run --rm "${IMAGE_FULLNAME}-go" -mode random)"; \
		echo "echo: $$ECHO"; \
		echo "rand: $$RAND"

go: go-build go-test

build: bash-build go-build

test: bash-test go-test

all: build test