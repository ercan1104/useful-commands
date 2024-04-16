# In VirtualBoxManage
```sh
vboxmanage convertdd image.img image.qcow2
```

# In qemu-img
```sh
qemu-img convert -f raw -O qcow2 -o preallocation=off image.img image.qcow2
```