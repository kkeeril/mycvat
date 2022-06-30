docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.ci.yml run cvat_ci /bin/bash \
          -c 'python manage.py test cvat-cli'
