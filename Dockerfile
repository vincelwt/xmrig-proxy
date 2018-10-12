FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev

# Grab the checked out source
RUN mkdir -p /xmrig
RUN mkdir -p /xmrig/build

WORKDIR /xmrig
COPY . /xmrig
COPY config.json ./build/

WORKDIR /xmrig/build

RUN cmake ..
RUN make

EXPOSE 80 3333 

CMD ["sh", "-c", "./xmrig-proxy"]