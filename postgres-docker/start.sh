#!/usr/bin/env bash

POSTGRES_DATA=/home/quasar/docker/psql-data
POSTGRES_USER_PASSWORD=inmelet1



docker run \
	-d \
	--name some-postgres \
	-e POSTGRES_PASSWORD=$POSTGRES_USER_PASSWORD \
	-v $POSTGRES_DATA:/var/lib/postgresql/data \
	postgres
