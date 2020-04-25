#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
. $SCRIPT_DIR/env.sh

while true
do
  for env in ${!TARGET_ENVIRONMENTS[@]}
  do
    url=${TARGET_ENVIRONMENTS[$env]}
    status=$(curl -LI $url -o /dev/null -w '%{http_code}\n' -s)
    echo $(date) $status >> $SCRIPT_DIR/result/$env-result.log
    if [ $status != "200" ]; then
      echo "ERROR: System down!! Env: $env Status: $status"
    fi
  done
  sleep ${INTERVAL_SECONDS}s
done
