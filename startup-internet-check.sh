#!/usr/bin/bash

declare -i timer=0
while [ "$timer" -le "90" ]; do
  status=$(curl -s -o /dev/null -w "%{http_code}" captive.apple.com)
  echo $status
  if [[ $status == 200 ]]; then
    break
  else
    if [ "$timer" -eq "90" ]; then
      sudo shutdown now
    fi
  fi
  ((timer++))
  sleep 1
done
