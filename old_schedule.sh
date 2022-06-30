DJANGO_SU_NAME="admin"
DJANGO_SU_EMAIL="admin@localhost.company"
DJANGO_SU_PASSWORD="12qwaszx"
API_ABOUT_PAGE="localhost:8080/api/server/about"

docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f ./tests/docker-compose.email.yml -f tests/docker-compose.file_share.yml -f components/serverless/docker-compose.serverless.yml up -d --build

while [[ $(curl -s -o /dev/null -w "%{http_code}" ${API_ABOUT_PAGE}) != "401" ]]; do sleep 5; done

docker exec -i cvat /bin/bash -c "echo \"from django.contrib.auth.models import User; User.objects.create_superuser('${DJANGO_SU_NAME}', '${DJANGO_SU_EMAIL}', '${DJANGO_SU_PASSWORD}')\" | python3 ~/manage.py shell"

cd ./tests
npm ci
npm run cypress:run:firefox
