# Creating minimal floppy linux image (format img)

Taken from <https://www.insentricity.com/a.cl/283>

## Compiling kernel to bzImage

```bash
git clone https://github.com/torvalds/linux
make ARCH=x86 tinyconfig
make ARCH=x86 menuconfig
# Processor type and features > Processor family > 486
# Device Drivers > Character devices > Enable TTY
# General Setup > Configure standard kernel features (expert users) > Enable support for printk
# General Setup > Initial RAM filesystem and RAM disk (initramfs/initrd) support > Support initial ramdisk/ramfs compressed using gzip
# Executable file formats > Kernel support for ELF binaries
make ARCH=x86 bzImage
```

## Convert to floppy disk

Download <https://landley.net/aboriginal/downloads/binaries/system-image-i486.tar.gz>, then unpack rootfs.cpio.gz

```bash
sudo dd if=/dev/zero of=linux-boot.img bs=1k count=1440
sudo mkdosfs linux-boot.img
sudo syslinux --install linux-boot.img
sudo mount -o loop linux-boot.img /mnt
sudo cp arch/x86/boot/bzImage /mnt
sudo cp rootfs.cpio.gz /mnt
```

Create /mnt/syslinux.cfg

```text
DEFAULT linux
LABEL linux
 KERNEL bzImage
 APPEND initrd=rootfs.cpio.gz
```

## End

```bash
sudo umount /mnt
```
