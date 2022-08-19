#!/usr/bin/env bash

users=(snc-provision system-it-test-reviewer system-macstadium system-mdm system-xtm system-readonly system-autoprov system-thunderdome system-devops)

for user in "${users[@]}"; do
  echo $user
  curl -X DELETE -n  -v https://code.devsnc.com/api/v3/users/${user}/suspended
done
