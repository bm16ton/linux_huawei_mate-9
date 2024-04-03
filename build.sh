#!/bin/bash
BUILD_START=$(date +"%s")
CMDSTUFF=$@
# Colours
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

# Kernel details
KERNEL_NAME="Firefly"
VERSION="v1.4"
DATE=$(date +"%d-%m-%Y-%I-%M")
DEVICE="Mate9"
FINAL_ZIP=$KERNEL_NAME-$VERSION-$DATE-$DEVICE.zip

# Dirs
KERNEL_DIR=$(pwd)
OUT_DIR=../out2
UPLOAD_DIR=~/flash_zip
ANYKERNEL_DIR=$KERNEL_DIR/AnyKernel2
KERNEL_IMG=..//out2/arch/arm64/boot/Image.gz

# Delete these annoying files
rm -rf mm/.memory.c.swp
rm -rf net/.Kconfig.swp
rm -rf arch/x86/kernel/cpu/bugs_64.c

# Export
# export PATH=$PATH:~/gcc-linaro-4.9.4-x86_64_aarch64-linux-gnu/bin
export PATH=/ssd2/android-ndk-r12b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin:$PATH
export CROSS_COMPILE=aarch64-linux-android-

# Make kernel
function make_kernel() {
  echo -e "$cyan***********************************************"
  echo -e "          Initializing defconfig          "
  echo -e "***********************************************$nocol"
#  make ARCH=arm64 O=../out2 merge_hi3660_defconfig
  echo -e "$cyan***********************************************"
  echo -e "             Building kernel          "
  echo -e "***********************************************$nocol"
  make ARCH=arm64 O=../out2 $CMDSTUFF -j16
if ! [ -a $KERNEL_IMG ];
  then
    echo -e "$red Kernel Compilation failed! Fix the errors! $nocol"
    exit 1
  fi
}

# Making zip
# removed ""# cp arch/arm64/boot/dts/auto-generate/hi3660_udp_default_config.dtb ../Android-Image-Kitchen/split_img/boot.img-dtb"
function make_zip() {
echo "enabling su"
sudo su -c "rm ../Android-Image-Kitchen/boot.img-bk ../Android-Image-Kitchen/boot.img-kernel-bk ; \
mv ../Android-Image-Kitchen/boot.img ../Android-Image-Kitchen/boot.img-bk ; \
cp ../Android-Image-Kitchen/split_img/boot.img-kernel ../Android-Image-Kitchen/boot.img-kernel-bk ; \
rm ../Android-Image-Kitchen/image-new.img ../Android-Image-Kitchen/split_img/boot.img-kernel ; \
cp ../out2/arch/arm64/boot/Image.gz ../Android-Image-Kitchen/split_img/boot.img-kernel ; \
cd ../Android-Image-Kitchen/ ; \
./repackimg.sh  --origsize ; \
cp image-new.img boot.img ; \
cp image-new.img ../og/boot.img ; \
exit "
echo -e "\n" ; echo -e "Android boot image is located at $(pwd)/boot.img\n" ; echo -e "\n"
echo "to flash boot into bootloader and flash, booting bootloader can be done with adb IE"
echo ""
echo "adb reboot bootloader"
echo ""
echo "then once its booted into bootloader/fastboot simply run"
echo ""
echo "fastboot flash boot boot.img"
echo ""
echo "then reboot into system with"
echo ""
echo "fastboot reboot"
echo ""
echo "if adb complains about multiple emulators etc just rerun the command"
#cp $KERNEL_IMG $ANYKERNEL_DIR/kernel-Image.gz
#mkdir -p $UPLOAD_DIR
#cd $ANYKERNEL_DIR
#zip -r9 UPDATE-AnyKernel2.zip * -x README UPDATE-AnyKernel2.zip
#mv $ANYKERNEL_DIR/UPDATE-AnyKernel2.zip $UPLOAD_DIR/$FINAL_ZIP
}

# Make kernel
function make_menuconfig() {
  make ARCH=arm64 CROSS_COMPILE=/ssd2/android-ndk-r12b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android- O=../out2 menuconfig
  cp ../out2/.config ./.config
  cp ../out2/.config arch/arm64/configs/merge_hi3660_defconfig
  make ARCH=arm64 CROSS_COMPILE=/ssd2/android-ndk-r12b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android- O=../out2 prepare
  make ARCH=arm64 CROSS_COMPILE=/ssd2/android-ndk-r12b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android- prepare 
  options
}


# Options
function options() {
  echo -e "$cyan                                           "
  echo -e " __     _____      _________    _____    ________            "
  echo -e "/\ \   / /  /__   /\___  ___\  / / _ \  /\  ____ \          "
  echo -e "\ \ \  \ \  __ \  \/_/ \ \    | | / \ | \ \ \ \ \ \         "
  echo -e " \ \_\  \ \ \_\ \     \ \_\   | | \_/ |  \ \ \ \ \ \         "
  echo -e "  \/_/   \_\____/      \/_/    \_\___/    \/_/  \/_/     "
  echo -e " 						   "
  echo -e "                                           $noco"
echo -e "$cyan*********************************************"
  echo "          Compiling kernel           "
  echo -e "***********************************************$nocol"
  echo -e " "
  echo -e " Select one of the following types of build : "
  echo -e " 1.Dirty"
  echo -e " 2.Clean"
  echo -e " 3.make menuconfig"
  echo -n " Your choice : ? "
  read ch
#  if [ "$ch" = "3" ]; then
#  make_menuconfig ;;
#  else
  echo
  echo
  echo -e " Select if you want zip or just kernel : "
  echo -e " 1.Get combined kernel/initrd boot image"
  echo -e " 2.Get kernel only"
  echo -n " Your choice : ? "
  read ziporkernel
  echo
  echo
##fi

case $ch in
  1) echo -e "$cyan***********************************************"
     echo -e "          	Dirty          "
     echo -e "***********************************************$nocol"
     make_kernel ;;
  2) echo -e "$cyan***********************************************"
     echo -e "          	Clean          "
     echo -e "***********************************************$nocol"
     make ARCH=arm64 distclean
     rm -rf ../out2
#     cp -r ~/Desktop/android/drivers/huawei_platform/lcd/tools/localperl/lib/5.14.2/x86_64-linux-thread-multi/CORE/libperl.a drivers/huawei_platform/lcd/tools/localperl/lib/5.14.2/x86_64-linux-thread-multi/CORE/libperl.a
#     cp -r ~/Desktop/android/scripts/kconfig/zconf.hash.c scripts/kconfig/zconf.hash.c
#     cp -r ~/Desktop/android/scripts/kconfig/zconf.lex.c scripts/kconfig/zconf.lex.c
#     cp -r ~/Desktop/android/scripts/kconfig/zconf.tab.c scripts/kconfig/zconf.tab.c
     make_kernel ;;
  3) make_menuconfig ;;
esac

     echo
     echo

if [ "$ziporkernel" = "1" ]; then
     echo -e "$cyan***********************************************"
     echo -e "     Making flashable zip        "
     echo -e "***********************************************$nocol"
     make_zip
else
     echo -e "$cyan***********************************************"
     echo -e "     Building Kernel only        "
     echo -e "***********************************************$nocol"
fi
}

# Clean Up
function cleanup(){
rm -rf $ANYKERNEL_DIR/kernel-Image.gz
rm -rf $ANYKERNEL_DIR/Image
rm -rf $ANYKERNEL_DIR/modules/*.ko
rm -rf $KERNEL_DIR/arch/arm/boot/dts/*.dtb
}

options
cleanup
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"

