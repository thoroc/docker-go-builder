#!/usr/bin/env bash

echo "> Environment Variables"
echo "GOROOT=${GOROOT}"
echo "GOPATH=${GOPATH}"
echo "GOOS=${GOOS}"
echo "GOARCH=${GOARCH}"
echo "BINARY=${BINARY}"
echo "PROJECT_PATH=${PROJECT_PATH}"
echo "GIT_HEAD=$(git rev-parse HEAD)"

BIN_DIR=${GOPATH}/${PROJECT_PATH}/bin
#SRC_DIR=${GOPATH}/${PROJECT_PATH}/src

echo "> Getting dependencies"
go get ./src

echo "> Building project"
GOOS=${GOOS} GOARCH=${GOARCH} go build -o ${BIN_DIR}/${BINARY} -v ./src

echo "> Listing builds"
ls -l ${BIN_DIR}

echo "Done"