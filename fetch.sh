#!/bin/sh
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.3.tar.xz
wget https://busybox.net/downloads/busybox-1.28.1.tar.bz2
tar -xf ./linux-4.15.3.tar.xz
tar -xf ./busybox-1.28.1.tar.bz2
cp ./kernel_config ./linux-4.15.3/.config
cp ./busybox_config  ./busybox-1.28.1/.config
