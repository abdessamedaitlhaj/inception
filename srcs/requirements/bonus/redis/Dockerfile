FROM debian:bullseye

RUN apt update && apt upgrade -y \
	&& apt install -y redis-server \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "redis-server", "--protected-mode", "no",\
			"--maxmemory", "256mb",\
			"--maxmemory-policy", "allkeys-lru" ]