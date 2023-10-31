#!/bin/bash
export OUT=${PWD}/out
export ARCH=arm64
export SUBARCH=arm64
export TARGET_BUILD_VARIANT=userdebug
#export DTC_EXT=dtc
export CROSS_COMPILE=${PWD}/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export KERNEL_DEFCONFIG=venus-qgki_defconfig
#set CONFIG_BUILD_ARM64_DT_OVERLAY=y
#set BUILD_CONFIG=build.config.gki.aarch64

O=$OUT REAL_CC=${PWD}/toolchains/llvm-Snapdragon_LLVM_for_Android_8.0/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- ${PWD}/scripts/gki/generate_defconfig.sh $KERNEL_DEFCONFIG
make O=$OUT REAL_CC=${PWD}/toolchains/llvm-Snapdragon_LLVM_for_Android_8.0/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- vendor/$KERNEL_DEFCONFIG
make -j$(nproc) O=$OUT REAL_CC=${PWD}/toolchains/llvm-Snapdragon_LLVM_for_Android_8.0/prebuilt/linux-x86_64/bin/clang CLANG_TRIPLE=aarch64-linux-gnu- 2>&1 | tee kernel.log