#!/usr/bin/env bash

export GIT_VERSION=$(git tag)

echo "> Environment Variables"
echo "CGO_ENABLED=$CGO_ENABLED"
echo "GOROOT=$GOROOT"
echo "GOPATH=$GOPATH"
echo "GOOS=$GOOS"
echo "GOARCH=$GOARCH"
echo "BINARY=$BINARY"
echo "PROJECT_PATH=$PROJECT_PATH"
echo "GIT_HEAD=$(git rev-parse HEAD)"
echo "GIT_VERSION=$GIT_VERSION"

BINARY=$BINARY-$GIT_VERSION

echo "> Clean bin folder"
rm ./bin/*

echo "> Getting dependencies"
go get ./src

echo "> Building project"
CGO_ENABLED=$CGO_ENABLED GOOS=$GOOS GOARCH=$GOARCH go build \
    -ldflags "-X main.version=$GIT_VERSION" \
    -o ./bin/$BINARY \
    -v ./src

echo "> Listing builds"
ls -l $BIN_DIR

echo "Done"