rmi: stop-test
	docker rmi asiqq23/npm 2>&1 > /dev/null

build:
	docker build -t asiqq23/npm:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage asiqq23/npm:latest
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t asiqq23/npm:latest

shell: build
	docker run --rm -i -t asiqq23/npm:latest /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push keyvanfatehi/sinopia:latest

test: start-test
