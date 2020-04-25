#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
. $SCRIPT_DIR/env.sh

TARGET_LOG_GROUP_NAMES=\
$(aws logs describe-log-groups \
  --log-group-name-prefix $TARGET_LOG_GROUP_PREFIX \
  --output text --query "logGroups[].logGroupName" \
  --profile $PROFILE)

for name in $TARGET_LOG_GROUP_NAMES
do
  if [ $name != "$EXCLUDE_LOG_GROUP_NAME" ]; then
    echo Delete: $name
    aws logs delete-log-group --log-group-name $name --profile $PROFILE
  else
    echo Skip: $name
  fi
done