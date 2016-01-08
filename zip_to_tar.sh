#!/usr/bin/env bash

if [ ! $@ ]; then
    echo "no input"
fi

if [ $@ ]; then
    FILENAME=$@
    NAME="${FILENAME%%.*}"

    unzip $NAME.zip -d ./unzip_tmp
    tar -czvf $NAME.tar.gz -C ./unzip_tmp/ .
    rm -rf unzip_tmp
    echo "New file: $NAME.tar.gz"
fi
