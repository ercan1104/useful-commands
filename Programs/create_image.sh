#!/bin/sh
qemu-img create -f qcow2 -o preallocation=off image.qcow2 2G