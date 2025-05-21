FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y redis-server \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "redis-server", "--protected-mode", "no",\
			"--maxmemory", "256mb",\
			"--maxmemory-policy", "allkeys-lru" ]