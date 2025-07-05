source util.sh
set_kernel_tree $1

sudo cp ${OUTPUT}/arch/x86/boot/bzImage . && \
sudo mount rootfs.ext2 mnt && \
sudo rm -rf mnt/lib/modules && \
sudo ./make.sh ${TARGET} modules_install INSTALL_MOD_PATH=$(pwd)/mnt && \
sudo sync

sudo umount mnt
