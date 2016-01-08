#!/usr/bin/env sh

KEY=$(cat ~/.ssh/id_rsa.pub)

if [ ! $@ ]; then
    echo "no input"
fi

if [ $@ ];then
    REMOTE_SERV=$@
    ssh $REMOTE_SERV "mkdir ~/.ssh/; echo $KEY >> ~/.ssh/authorized_keys; chmod 700 ~/.ssh; chmod 644 ~/.ssh/authorized_keys"
fi
