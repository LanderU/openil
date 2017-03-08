#!/usr/bin/env bash

#
# Change the toolchain from aarch64 to armv7 to build 32b kernel and fs
#
# ${2} - uboot building directory

echo ${2}
echo ${3}

rm .config

rm -rf board/nxp/ls1043ardb/temp
mkdir board/nxp/ls1043ardb/temp

cp output/images/* board/nxp/ls1043ardb/temp/
cp ${2}/tools/mkimage board/nxp/ls1043ardb/temp/

make clean

cp board/nxp/ls1043ardb/ls1043ardb-32b_linux_fs_defconfig configs/ls1043ardb-32b_linux_fs_defconfig

make ls1043ardb-32b_linux_fs_defconfig

rm -f configs/ls1043ardb-32b_linux_fs_defconfig

make
