#!/bin/sh
set -e

mkdir -p "output"

# ---

docker build -t lambda-go .

containerId=$(docker create -ti lambda-go bash)

docker cp ${containerId}:/app/lambda-go.zip ./output
docker cp ${containerId}:/app/lambda-go-arm.zip ./output
docker rm ${containerId}
