#!/usr/bin/env bash

cat hosts.txt | while read line
do
    if ! [[ $(ping6 -c 1 $line 2>/dev/null) || $(ping -c 1 $line 2>/dev/null) ]]; then
        echo $line >> hosts_unreachable.txt
    fi
done
