#!/usr/bin/env bash

cat hosts.txt | while read line
do
#    echo $(host $line)
    if host $line | grep -qE "not found"
        then echo $line >> hosts_no_dns.txt
    fi
done
