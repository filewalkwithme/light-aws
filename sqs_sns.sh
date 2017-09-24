#!/bin/sh

echo "Starting goaws"
docker run --rm --name goaws -v=$PWD/sqs_sns.yaml:/conf/goaws.yaml -p 4100:4100 pafortin/goaws
