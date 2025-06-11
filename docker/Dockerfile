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
COPY ./docker/sugarchain.conf /sugarchain/sugarchain.conf

WORKDIR /sugarchain

# 🔧 AUTOGEN.SH - created inline manually
RUN echo '#!/bin/sh' > autogen.sh && \
    echo 'set -e' >> autogen.sh && \
    echo 'autoreconf -vif' >> autogen.sh && \
    chmod +x autogen.sh

RUN ./autogen.sh
RUN ./configure --without-gui
RUN make -j$(nproc)
RUN make install

RUN mkdir -p /root/.sugarchain
RUN cp /sugarchain/sugarchain.conf /root/.sugarchain/sugarchain.conf

EXPOSE 34230

CMD ["sugarchaind", "-printtoconsole"]
