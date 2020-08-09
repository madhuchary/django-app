#!/bin/bash
CONTAINER_NAME=django-cnt
docker rm -f $CONTAINER_NAME || exit 0
docker  run  -d  -p  8000:8000  -v /godata/pipelines/publish:/code --name $CONTAINER_NAME django:v0.1
docker exec $CONTAINER_NAME python manage.py test 
docker exec $CONTAINER_NAME zip django-app-v0_1.zip blog mysite
