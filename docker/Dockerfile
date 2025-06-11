FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    git build-essential libtool autotools-dev automake pkg-config \
    bsdmainutils curl ca-certificates python3 \
    libevent-dev libboost-system-dev libboost-filesystem-dev \
    libboost-chrono-dev libboost-test-dev libboost-thread-dev \
    libminiupnpc-dev libzmq3-dev libnatpmp-dev \
    libseccomp-dev libcap-dev libsqlite3-dev software-properties-common

COPY ./node-source /sugarchain
WORKDIR /sugarchain

# ✅ BURASI ÖNEMLİ: İzin veriyoruz
RUN chmod +x autogen.sh && \
    ./autogen.sh && \
    ./configure --without-gui && \
    make -j$(nproc) && \
    make install

RUN mkdir -p /root/.sugarchain
COPY ./docker/sugarchain.conf /root/.sugarchain/sugarchain.conf

EXPOSE 34230
CMD ["sugarchaind", "-printtoconsole"]
