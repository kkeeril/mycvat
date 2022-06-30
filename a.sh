API_ABOUT_PAGE="localhost:8080/api/server/about"
count=1
status_code=$(curl -s -o /dev/null -w "%{http_code}" ${API_ABOUT_PAGE})
while [[  $status_code != "401" && count -lt 30 ]]
do
  echo Number of attempts: $count
  echo Status code of response: $status_code

  sleep 5
  status_code=$(curl -s -o /tmp/server_response -w "%{http_code}" ${API_ABOUT_PAGE})
  (( count++ ))
done
if [[ $status_code != "401" ]]; then
   echo Response from server is incorrect, output:
   cat /tmp/server_response
fi
q
