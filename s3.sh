#!/bin/bash

echo "Checking if minio-data volume is created:"
docker volume inspect minio-data
if [ $? -ne 0 ]; then
    echo "Creating minio-data volume."
    docker volume create minio-data
fi

if [ $? -eq 0 ]; then
    echo "minio-data volume setup complete"
else
    echo "Error while checking for minio-data volume."
    exit 1
fi

echo "Checking if minio-config volume is created:"
docker volume inspect minio-config
if [ $? -ne 0 ]; then
    echo "Creating minio-config volume."
    docker volume create minio-config
fi

if [ $? -eq 0 ]; then
    echo "minio-config volume setup complete"
else
    echo "Error while checking for minio-config volume."
    exit 1
fi

echo "Starting minio"
docker run -p 9001:9000 -d --rm --name minio -e "MINIO_ACCESS_KEY=ABCDEFGHJHIJKLMNOPQR" -e "MINIO_SECRET_KEY=abcdefghijklmnopqrstuvxwyz0123456789ABCD" --mount source=minio-data,target=/data --mount source=minio-config,target=/root/.minio minio/minio server /data
