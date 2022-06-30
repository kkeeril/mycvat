docker_files_1="\
-f docker-compose.yml \
-f docker-compose.dev.yml \
-f components/analytics/docker-compose.analytics.yml \
"

docker_files_2="\
-f docker-compose.tests.yml \
-f docker-compose.dev.yml \
-f components/analytics/docker-compose.analytics.tests.yml \
"

# -f tests/rest_api/docker-compose.minio.yml "
# -f components/serverless/docker-compose.serverless.yml \
# -f tests/rest_api/docker-compose.tests.yml \

alias cvat_down="docker compose $docker_files_1 down"
alias cvat_up="docker compose $docker_files_1 up -d"

# alias cvat_down_2="docker compose -p 2 $docker_files_2 down"
# alias cvat_up_2="docker compose -p 2 $docker_files_2 up"

alias restart_cvat="\
docker-compose $docker_files down -v;\
docker-compose $docker_files up -d\
"

alias cvat_db="docker exec cvat_db"

alias cvat_db_size="docker exec cvat_db psql -d postgres -c \"SELECT pg_size_pretty(pg_database_size('cvat')); \""