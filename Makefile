all: bzImage initramfs.cpio.gz

.PHONY: all bzImage _install qemu qemu_gdb clean 

bzImage: unarchive
	cd $(CURDIR)/linux-4.15.3 && make -j bzImage

_install: unarchive
	cd $(CURDIR)/busybox-1.28.1 && make install

initramfs.cpio.gz: _install 
	gcc -static -o init init.c
	cp ./init ./busybox-1.28.1/_install/
	cp ./init.ash ./busybox-1.28.1/_install/
	cd ./busybox-1.28.1/_install/ && find . | cpio --quiet -H newc -o | gzip > ../../$@

linux-4.15.3.tar.xz: download
	wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.3.tar.xz
	touch $@

busybox-1.28.1.tar.bz2: download
	wget https://busybox.net/downloads/busybox-1.28.1.tar.bz2
	touch $@

unarchive: linux-4.15.3.tar.xz busybox-1.28.1.tar.bz2
	tar -xf ./linux-4.15.3.tar.xz
	tar -xf ./busybox-1.28.1.tar.bz2
	cp ./kernel_config ./linux-4.15.3/.config
	cp ./busybox_config  ./busybox-1.28.1/.config
	touch $@

qemu: 
	qemu-system-x86_64 -m 256 -nographic -kernel ./linux-4.15.3/arch/x86_64/boot/bzImage -initrd ./initramfs.cpio.gz -append console=ttyS0

qemu_gdb:
	qemu-system-x86_64 -s -S -m 256 -nographic -kernel ./linux-4.15.3/arch/x86_64/boot/bzImage -initrd ./initramfs.cpio.gz -append console=ttyS0

clean:
	git clean -fdx
