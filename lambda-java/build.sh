#!/bin/sh
set -e

mkdir -p "output"

# ---

docker build -t lambda-java .

containerId=$(docker create -ti lambda-java bash)

docker cp ${containerId}:/app/target/lambda-java-1.0-SNAPSHOT.jar ./output
docker rm ${containerId}
