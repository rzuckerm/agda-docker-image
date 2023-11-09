FROM ubuntu:23.10

COPY AGDA_* /tmp/
RUN apt-get update && \
    apt-get install -y agda && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
