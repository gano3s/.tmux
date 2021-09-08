#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    #running on Mac OS
    INTERFACE=`netstat -nr | grep default | head -n 1| tr -s " " | cut -d " " -f 4 `
    IP=`ifconfig $INTERFACE 2>/dev/null | grep "inet " | tr -s " " | cut -d" " -f2`
    echo $IP 2>/dev/null
else
    #running on Linux
    INTERFACE=`netstat -nre | tail -n +3 | tr -s " " | cut -d " " -f 5,8 | sort -n | uniq | cut -d " " -f2 | head -1`
    IP=`ip addr show dev $INTERFACE  2>/dev/null | grep "inet " | tr -s " " | cut -d " " -f 3 | cut -d "/" -f1`
    echo $IP 2>/dev/null
fi