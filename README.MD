# Django on Docker Demo


## Development Server

docker-compose up -d --build

### Start new app in project

    docker-compose exec web python manage.py startapp <appname>

### Migrate databases

    docker-compose exec web python manage.py migrate --noinput


## Local production setup

    docker-compose -f docker-compose.prod.yml up -d --build
    docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput
    docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear



#### Footnotes
Reference: https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/