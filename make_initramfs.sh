#!/bin/sh
gcc -static -o init init.c
cp ./init ./busybox-1.28.1/_install/
cp ./init.ash ./busybox-1.28.1/_install/
cd ./busybox-1.28.1/_install/
find . | cpio --quiet -H newc -o | gzip > ../../initramfs.cpio.gz
cd ../../

