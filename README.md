# Light AWS

The main goal of Light AWS is provide an way to run local versions of some AWS services without too much complexity. You should be able to just run something like `./start-light.sh` and have clones of `S3, SQS and SNS` running on your `localhost`.

# Services and Ports

- `localhost:9001` - S3
- `localhost:9002` - SQS/SNS

# Approach

Light AWS is a simple wrapper built around great tools like [Minio](https://github.com/minio/minio) and [goaws](https://github.com/p4tin/goaws).

This project itself is just a bunch of shell scripts which launches Docker containers for Minio and goaws.

# Setup

Docker is required to run the services on your localhost.

In order to setup the credentials, you need to add `light-aws` profile to your `aws-cli` credentials file. Just append the following section at the end of your `~/.aws/credentials` file.

```
[light-aws]
aws_access_key_id=ABCDEFGHJHIJKLMNOPQR
aws_secret_access_key=abcdefghijklmnopqrstuvxwyz0123456789ABCD
region = us-east-1
```

# Start

```
./start-light.sh
```

# Stop

```
./stop-light.sh
```

# Test

The easiest way to test is just use the `aws-cli` passing the `endpoint` and `profile` parameters:

```
# create a bucket called s3://mybucket
aws --endpoint-url http://localhost:9001 --profile light-aws s3 mb s3://mybucket`

# list buckets
aws --endpoint-url http://localhost:9001 --profile light-aws s3 ls

# create SQS queue
aws --endpoint-url http://localhost:9002 --profile light-aws sqs create-queue --queue-name myqueue

# List SQS queues
aws --endpoint-url http://localhost:9002 --profile light-aws sqs list-queues

# create SNS topic
aws --endpoint-url http://localhost:9002 --profile light-aws sns create-topic --name mytopic

# List SNS topic
aws --endpoint-url http://localhost:9002 --profile light-aws sns list-topics
```

# Contribute

This project is in a very early state. Bugs are expected and contributions are welcome! =)
