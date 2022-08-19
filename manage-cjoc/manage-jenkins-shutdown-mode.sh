#!/usr/bin/env bash

JENKINS_USER=chao.liu

function post_request() {
  url=$1
  set -x
  curl -X POST -u ${JENKINS_USER}:${JENKINS_PASS} ${url}
  set +x
}

cmd=$1
if [ "${cmd}" != 'safeRestart' -a "${cmd}" != "quietDown" -a "${cmd}" != "cancelQuietDown" ]; then
  echo "Usage: $0 <safeResrart | quietDown | cancelQuietDown>"
  exit 1
fi

if [ "${JENKINS_PASS}" = '' ]; then
  echo "Please export Jenkins password to JENKINS_PASS"
  exit 1
fi

for mm in $(cat ./teams-jenkins.list); do
  # post_request "https://build.devsnc.com/teams-${mm}/${cmd}"
  echo "process ${mm}"
done

old_masters=(alpha bravo charlie delta echo foxtrot golf hotel india kilo)

for old_master in "${old_masters[@]}"; do
  echo "process ${old_master}"
done
