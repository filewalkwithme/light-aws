#!/bin/bash

docker volume create minio-data
docker volume create minio-config
docker run -p 9000:9000 --name minio1 --mount source=minio-data,target=/data --mount source=minio-config,target=/root/.minio minio/minio server /data
