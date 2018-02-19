readonly MAX_THRESHOLD=8
readonly GRAPHQL_PROJECT="aMat"
readonly JQ_CURSOR='.pageInfo.startCursor'
readonly JQ_REF_DATA='(.nodes[] | select(.headRef != null) | "\(.author.login) \(.headRefName)")'

threshold=0
cursor=""

generate_cursor_query() {
  if [[ $cursor ]]; then
    echo "\"$cursor\""
  else
    echo "null"
  fi
}

total_results=()
while [ $MAX_THRESHOLD -gt $threshold ]; do
  variables='{"owner": "lumoslabs", "name": "lumos_rails", "cursor":'"$(generate_cursor_query)"'}'
  response=$(graphql query stale-branch.gql -a -p "$GRAPHQL_PROJECT" --variables="$variables")
  round=`echo $response | jq -r ".data.repository.pullRequests | ${JQ_CURSOR}, ${JQ_REF_DATA}"`
  cursor=`echo "$round" | head -n 1`
  results=`echo "$round" | tail -n +2`

  IFS=$'\n'
  for result in $results; do
    total_results+=($result)
  done
  unset IFS
  ((++threshold))
done

echo "TOTAL BRANCHES: ${#total_results[@]}"
printf '%s\n' "${total_results[@]}" | sort | uniq
