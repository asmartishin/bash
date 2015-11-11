#!/usr/bin/env bash

HEX="0x"
RESULT=0
SUM=0
END=$(cat memory_count.txt | awk '{if ($5 > 0) print $1}' | awk -F "-" '{print $2}')
START=$(cat memory_count.txt | awk '{if ($5 > 0) print $1}' | awk -F "-" '{print $1}')
LINES=$(echo $START | tr " " "\n" | wc -l)
LINES=$(($LINES-1))
RSTART=(`echo ${START}`)
REND=(`echo ${END}`)
#echo "$REND"
for i in `seq 0 $LINES`; do
    RESULT[$i]=$(echo $(($(($HEX${REND[$i]}))-$(($HEX${RSTART[$i]})))))
    #-${RSTART[$i]}
done
for j in `seq 0 $LINES`; do
    SUM=$(($SUM+${RESULT[$i]}))
done
echo $SUM
