FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y redis vim netcat curl procps \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "vm.overcommit_memory=1" >> /etc/sysctl.conf

ENTRYPOINT [ "redis-server", "--protected-mode", "no", 			\
							 "--maxmemory", "256mb", 			\
							 "--maxmemory-policy", "allkeys-lru" ]