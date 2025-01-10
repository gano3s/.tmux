#!/bin/bash

echo $(/opt/forticlient/forticlient-cli vpn status | grep Status | cut -d":" -f2 | tr -d " ")
