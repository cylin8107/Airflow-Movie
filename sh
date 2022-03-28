#!/bin/bash


IMAGE_NAME='np-airflow-chiyu'
HOST_PORT='6798'
CONTAINER_NAME=${IMAGE_NAME}''
BASE_PATH=$PWD
SETTING_USER=0
INIT_DATABASE=0
RUNNING_AIRFLOW=1


if [ ${SETTING_USER} = 1 ]
then
mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env
fi


if [ ${INIT_DATABASE} = 1 ]
then
docker-compose up airflow-init
fi


if [ ${RUNNING_AIRFLOW} = 1 ]
then
docker-compose up -d
fi