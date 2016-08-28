
VERSION = 0.1.0

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-ntp:${VERSION}
	-docker rmi amarkwalder/cdk-ntp:latest
.PHONY: clean

build:
	docker build -t amarkwalder/cdk-ntp:${VERSION} .
.PHONY: build

tag:
	docker pull amarkwalder/cdk-ntp:${VERSION}
	docker tag amarkwalder/cdk-ntp:${VERSION} amarkwalder/cdk-ntp:latest
	docker push amarkwalder/cdk-ntp:latest
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-ntp:${VERSION}
.PHONY: run
