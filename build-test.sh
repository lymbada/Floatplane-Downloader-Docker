#!/bin/bash

DOCKERFILE="Dockerfile"

# quick way to build & run the docker test locally
if [ "$1" == "test" ]
then
  echo "Using test Dockerfile"
  DOCKERFILE="Dockerfile_test"
fi


docker build --tag fp:test1 --file $DOCKERFILE . &&
docker run --rm \
-v /tmp/fp/config:/Floatplane-Downloader/config \
-v /tmp/fp/videos:/Floatplane-Downloader/videos \
-it \
fp:test1
