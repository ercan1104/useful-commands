#!/bin/sh
qemu-system-x86_64 -net bridge,br=virbr0 -net nic,model=virtio -drive file=disk.img,format=raw,index=0,media=disk