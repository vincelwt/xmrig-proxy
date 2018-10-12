FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install --qq git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev

# Grab the checked out source
RUN mkdir -p /xmrig
RUN mkdir -p /xmrig/build

WORKDIR /xmrig
COPY . /xmrig

WORKDIR /xmrig/build
COPY ../config.json .

RUN cmake ..
RUN make

CMD ['./xmrig-proxy']