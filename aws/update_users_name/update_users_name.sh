#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
. $SCRIPT_DIR/env.sh

USER_NAMES=$(aws iam list-users --output text --query Users[].UserName --profile $PROFILE)

for old_user_name in $USER_NAMES
do
  if [[ $old_user_name == *$TARGET_STRING* ]]; then
    new_user_name=$(echo $old_user_name | sed -e "s/$TARGET_STRING/$NEW_STRING/g")
    aws iam update-user --user-name $old_user_name --new-user-name $new_user_name --profile $PROFILE
    echo Update success! From: $old_user_name To: $new_user_name
  fi
done
