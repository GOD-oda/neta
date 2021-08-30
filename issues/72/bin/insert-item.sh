#!/usr/bin/env bash

current_dir=$(cd $(dirname $0); pwd)
source "${current_dir}/config.sh"

aws dynamodb \
  --region $REGION \
  --endpoint-url $ENDPOINT_URL \
    put-item \
  --table-name $TABLE \
  --item '
    {
      "userId": {
        "N": "1"
       },
      "userName": {
        "S": "山田太郎"
      },
      "age": {
        "N": "29"
      },
      "contactNumber": {
        "S": "080-1234-5678"
      }
    }
  '
