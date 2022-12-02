FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y bison flex libreadline-dev libc6-dev libfl-dev wget vim make gcc curl unzip build-essential tar

RUN useradd -m xos
USER xos

RUN cd /home/xos \
    && curl -sSf https://xosnitc.github.io/files/myxos-1.0.1.tar.gz --output myxos-1.0.1.tar.gz\
    && tar -xzvf myxos-1.0.1.tar.gz \
    && rm myxos-1.0.1.tar.gz \
    && cd ./myxos \
    && make
    

WORKDIR /home/xos/myxos

