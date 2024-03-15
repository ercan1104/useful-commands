#!/bin/sh
ip link set eth0 up
dhcpcd

if [ $? -eq 127 ]; then
    dhclient eth0
fi