#!/usr/bin/env bash

current_dir=$(cd $(dirname $0); pwd)
source "${current_dir}/config.sh"

aws dynamodb \
  --region $REGION \
  --endpoint-url $ENDPOINT_URL \
  scan \
  --table-name $TABLE

