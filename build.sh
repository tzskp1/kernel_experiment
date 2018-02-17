#!/bin/sh
cd $(dirname $0)
./fetch.sh 
./make_initramfs.sh 
