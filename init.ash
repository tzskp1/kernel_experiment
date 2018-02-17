#!/bin/ash
export PATH="/bin:/sbin:/usr/bin"
mkdir /proc
mkdir /sys
mount -t proc  none /proc
mount -t sysfs none /sys
ash
