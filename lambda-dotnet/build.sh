#!/bin/sh
set -e

mkdir -p "output"

# ---

docker build -t lambda-dotnet .

containerId=$(docker create -ti lambda-dotnet bash)

docker cp ${containerId}:/app/lambda-dotnet/. ./output
docker rm ${containerId}
