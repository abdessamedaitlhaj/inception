# FROM debian:bullseye

# LABEL maintainer="contact@yavuzsonmez.com"

# RUN apt update && apt install -y curl make git nodejs npm
# RUN npm install -g pnpm


# RUN apt install -y golang
# ENV PATH=$PATH:/usr/local/go/bin:/root/go/bin
# RUN go version
# RUN go install github.com/cespare/reflex@latest

# COPY ./script.sh /script.sh
# RUN chmod +x script.sh

# COPY ./package.json /package.json

# CMD ["sh", "script.sh"]

FROM debian:bullseye

LABEL maintainer="contact@yavuzsonmez.com"

# Install dependencies
RUN apt update && apt install -y curl make git gnupg
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs procps

# Install pnpm
RUN npm install -g pnpm

# Install Go from the official source (e.g., Go 1.22)
ENV GOVER=1.23.0
RUN curl -LO https://go.dev/dl/go${GOVER}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GOVER}.linux-amd64.tar.gz && \
    rm go${GOVER}.linux-amd64.tar.gz



# Set Go paths
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GO111MODULE=on

# Confirm Go version
RUN go version

# Install reflex
RUN go install github.com/air-verse/air@latest

RUN apt-get update && apt-get install -y golang-go
RUN go install github.com/cespare/reflex@latest
ENV PATH="$PATH:/root/go/bin"

# Copy script and make it executable
COPY ./script.sh /script.sh
RUN chmod +x /script.sh

# Copy package.json (to trigger installs in script maybe?)
COPY ./package.json /package.json

# Default command
CMD ["sh", "/script.sh"]
