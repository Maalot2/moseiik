FROM ubuntu:latest

RUN apt-get update \
 && apt-get install cargo -y \
 && apt-get install -y git \
 && apt-get install -y unzip \
 && apt-get install -y wget \
 && apt-get clean

ADD . /app/moseiik

COPY . /app/moseiik

WORKDIR /app/

WORKDIR /app/moseiik

RUN cargo build --release

ENTRYPOINT [ "cargo", "test", "--release"]
