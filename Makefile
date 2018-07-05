.DEFAULT: dry

IMAGE := golang:1.10

PROJECT_DIR := github.com/thoroc/docker-go-builder
ROOT_DIR := $(shell pwd | sed 's!.*/!!')

VERSION := $(shell git describe --tags)
BUILD := $(shell git rev-parse HEAD)

LDFLAGS := -ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"

BINARY=${BINARY}-${GIT_VERSION}

.PHONY: build
build: ## see the build command before actually building
	docker-compose up docker-go-builder

.PHONY: clean
clean: ## Cleans our project: deletes binaries
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi
