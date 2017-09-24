#!/bin/sh

echo "Starting goaws"
docker run -d --rm --name goaws -v=$PWD/sqs_sns.yaml:/conf/goaws.yaml -p 9002:9002 pafortin/goaws
