#!/usr/bin/env sh

failed_repo=""
for org in $(ruby ./ghe_get_org_id.rb | grep -v -e '#' -e 'Organization' | awk '{print $1}'); do
  echo "${org}"
  for repo in $(ruby ./ghe_list_repo.rb ${org} | grep -v -e '#' -e 'id | name' -e 'Total size' -e 'Number of repos' -e 'GitHub Server' | awk '{print $3}'); do
    cmd="curl -o /dev/null -s -w \"%{http_code}\" -X PATCH -n --header \"Content-type: application/json\" --data \"{\\\"name\\\":\\\"$repo\\\",\\\"allow_merge_commit\\\":true}\" ${OCTOKIT_API_ENDPOINT}/repos/${org}/${repo}"
    echo $cmd
    # ret_code="200"
    ret_code=$(curl -o /dev/null -s -w "%{http_code}" -X PATCH -n --header "Content-type: application/json" --data "{\"name\":\"$repo\",\"allow_merge_commit\":true}" ${OCTOKIT_API_ENDPOINT}/repos/${org}/${repo})
    if [ "${ret_code}" != "200" ]; then
      failed_repo="${failed_repo} ${org}/${repo}"
    fi
  done
done

if [ "${failed_repo}" != "" ]; then
  echo "Failed repos: ${failed_repo}"
fi
