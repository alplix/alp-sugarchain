#!/bin/bash
set -e

chmod +x autogen.sh
./autogen.sh
./configure --without-gui
make -j$(nproc)
make install
