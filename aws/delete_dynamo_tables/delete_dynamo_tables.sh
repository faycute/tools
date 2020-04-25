#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
. $SCRIPT_DIR/env.sh

for table in ${TABLE_NAMES[@]}
do
  echo Delete: $table
  aws dynamodb delete-table --table-name $table --profile $PROFILE
done