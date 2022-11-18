FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y bison flex libreadline-dev libc6-dev libfl-dev wget vim make gcc curl unzip build-essential

RUN useradd -m expos
USER expos

RUN cd /home/expos \
    && curl -sSf https://raw.githubusercontent.com/eXpOSNitc/expos-bootstrap/main/download.sh | sh \
    && cd /home/expos/myexpos \
    && make

WORKDIR /home/expos/myexpos

