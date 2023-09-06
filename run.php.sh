#!/bin/bash
source .env
export PROJECT_NAME

docker exec -it ${PROJECT_NAME}_php bash
