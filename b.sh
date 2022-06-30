count=0
API_ABOUT_PAGE="localhost:8080/api/server/about"
status_code=$(curl -s -o /dev/null -w "%{http_code}" ${API_ABOUT_PAGE})
echo $status_code
/bin/bash -c \
'while [[ $status_code != "301" && count -lt 2 ]]; do (( count++ )); echo $count; done'
