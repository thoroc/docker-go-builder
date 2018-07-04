#!/usr/bin/env bash

export VERSION=$(git tag)
export BUILD=$(git rev-parse HEAD)
export LDFLAGS="-X main.Version=${VERSION} -X main.Build=${BUILD}"

echo "> Environment Variables"
echo "CGO_ENABLED=$CGO_ENABLED"
echo "GOROOT=$GOROOT"
echo "GOPATH=$GOPATH"
echo "GOOS=$GOOS"
echo "GOARCH=$GOARCH"
echo "BINARY=$BINARY"
echo "PROJECT_PATH=$PROJECT_PATH"
echo "VERSION=$VERSION"
echo "BUILD=$BUILD"
echo "LDFLAGS=$LDFLAGS"

#echo "> Clean bin folder"
#rm ./bin/*

echo "> Getting dependencies"
go get ./src

#    -ldflags $LDFLAGS \
echo "> Building project"
CGO_ENABLED=$CGO_ENABLED GOOS=$GOOS GOARCH=$GOARCH go build \
    -ldflags "-X main.version=$VERSION" \
    -o ./bin/$BINARY \
    -v ./src

echo "> Listing builds"
ls -l ./bin

echo "Done"