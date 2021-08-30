#!/usr/bin/env bash

current_dir=$(cd $(dirname $0); pwd)
source "${current_dir}/config.sh"

aws dynamodb \
  --region $REGION \
  --endpoint-url $ENDPOINT_URL \
    create-table \
  --table-name $TABLE \
  --attribute-definitions \
    AttributeName=userId,AttributeType=N \
    AttributeName=userName,AttributeType=S \
  --key-schema \
    AttributeName=userId,KeyType=HASH AttributeName=userName,KeyType=RANGE \
  --billing-mode PAY_PER_REQUEST
