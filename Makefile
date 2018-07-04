.DEFAULT: dry

IMAGE := golang:1.10

PROJECT_DIR := github.com/thoroc/docker-go-builder
ROOT_DIR := $(shell pwd | sed 's!.*/!!')

VERSION := $(shell git describe --tags)
BUILD := $(shell git rev-parse HEAD)

LDFLAGS := -ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"

BINARY=${BINARY}-${GIT_VERSION}

.PHONY: dry
dry: ## see the build command before actually building
	docker-compose up docker-go-builder
#	@echo "go build ${LDFLAGS} -o ${BINARY}"
#	docker run ${IMAGE} \
#		-v .:/go/src/${PROJECT_DIR} \
#		-e PROJECT_PATH=${PROJECT_DIR} \
#		-e CGO_ENABLED=0 \
#		-e BINARY=${BINARY} \
#		-e GOOS=linux \
#		-e GOARCH=amd64 \
#		-t ${ROOT_DIR}

#build: ## Builds the project
#	go build ${LDFLAGS} -o ${BINARY}
#
#.PHONY: install
#install: ## Installs our project: copies binaries
#	go install ${LDFLAGS}

.PHONY: clean
clean: ## Cleans our project: deletes binaries
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi
