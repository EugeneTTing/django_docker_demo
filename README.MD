# Django on Docker Demo

This demo is a modified version of a post on testdriven.io.

A simple Django application which can be launched in a development or a local production environment. 

The purpose of this demo is to gain further understanding

## Development Environment

The development environment can be started using the following command when in the project root:

    docker-compose up -d --build

The web application can be accessed by visiting https://localhost:8000. 

### Start new app in project

When in the devlopment environemnt, a new Django app in the current project can be started by running the following command:

    docker-compose exec web python manage.py startapp <appname>

This will cause the new app's associated directory to be created in the `./app` directory on the host machine. The directory and the files inside may be owned by the root user and therefore prevent editing. Th epermission should be changed by changing the ownership of the new files with: `chown -R <owner>:<group> <newapp>`.

### Migrate databases

Database migrations can be executed with the following command.

    docker-compose exec web python manage.py migrate --noinput


## Local Production Setup

The local production setup with Gunicorn and Nginx can be launched with the following commands:

    docker-compose -f docker-compose.prod.yml up -d --build
    docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput
    docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear

The web application can be accessed at https://localhost:1337

### Server Logs

    docker-compose [-f DOCKER_COMPOSE_YAML] logs

### Open Interactive Shell to Container

    docker exec -it <CONTAINER_ID> sh

#### Footnotes
Reference: https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/