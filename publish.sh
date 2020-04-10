#!/bin/sh
#
# Copyright 2020 Loopring Org. All Rights Reserved.
# Author: chao@loopring.org (Ma Chao)

time=$(date "+%Y%m%d-%H%M%S")

./xdoc.py build && \
    cd generated && \
    rm -rf ./docs && \
    gitbook build . docs && \
    cd .. && rm -rf ./docs && \
    cp -rf generated/docs . && \
    ./xdoc.py windup && \
    git add . && git commit -m "publish ${time}" && git push origin master
