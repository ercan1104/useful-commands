#!/bin/sh
qemu-system-x86_64 -m 512 -vga cirrus -device rtl8139,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22 -drive file=c.img,format=raw,index=0,media=disk