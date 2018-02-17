#!/bin/sh
qemu-system-x86_64 -m 256 -nographic -kernel ./linux-4.15.3/arch/x86_64/boot/bzImage -initrd ./initramfs.cpio.gz -append console=ttyS0,115200
