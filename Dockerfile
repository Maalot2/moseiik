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
RUN wget "https://filesender.renater.fr/download.php?token=178558c6-7155-4dca-9ecf-76cbebeb422e&files_ids=33679270" -O images.zip

RUN unzip /app/images.zip -d /app/moseiik/assets/

WORKDIR /app/moseiik

RUN cargo build --release

ENTRYPOINT [ "cargo", "test", "--release"]