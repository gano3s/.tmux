#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    #running on Mac OS
    INTERFACE=`netstat -nr | grep default | head -n 1| tr -s " " | cut -d " " -f 4 2>/dev/null`
    IP=`ifconfig $INTERFACE 2>/dev/null | grep "inet " | tr -s " " | cut -d" " -f2`
    echo $IP 2>/dev/null
else
    #running on Linux
    INTERFACE=`netstat -nr | tail -n +3 | head -n 1 | tr -s " " | cut -d" " -f8 2>/dev/null`
    IP=`ip addr show dev $INTERFACE  2>/dev/null | grep "inet " | tr -s " " | cut -d " " -f 3 | cut -d "/" -f1`
    echo $IP 2>/dev/null
fi