target remote localhost:1234
source linux-4.15.3
symbol-file linux-4.15.3/vmlinux
b start_kernel
la src
c
