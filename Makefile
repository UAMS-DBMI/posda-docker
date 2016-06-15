POSDA_CACHE = /home/quasar/docker/posda-cache

all: posda 

force: clean all

clean:
	rm posda-docker/last-build-timestamp


posda: posda-docker/last-build-timestamp

posda-docker/last-build-timestamp: posda-docker/Dockerfile
	docker build -t quasarj/posda posda-docker
	touch posda-docker/last-build-timestamp


start:
	docker run -d \
		--link some-postgres:postgres \
		-e PGHOST=postgres \
		-e PGUSER=postgres \
		-e PGPASSWORD=inmelet1 \
		-v ${POSDA_CACHE}:/cache \
		-p 64610-64640:64610-64640 \
		--name posda-run \
		quasarj/posda	
log:
	docker logs -f posda-run

test:
	docker run -i -t --rm \
		--link some-postgres:postgres \
		-e PGHOST=postgres \
		-e PGUSER=postgres \
		-e PGPASSWORD=inmelet1 \
		-v ${POSDA_CACHE}:/cache \
		--name posda-run \
		quasarj/posda	 \
		bash

setup:
	docker run -i -t --rm \
		-v ${POSDA_CACHE}:/cache \
		--name posda-setup \
		quasarj/posda	 \
		/scripts/new_user.sh

stop:
	docker stop posda-run
	docker rm posda-run


start-postgres:
	echo Starting postgres instance...
	./postgres-docker/start.sh

stop-postgres:
	./postgres-docker/stop.sh
