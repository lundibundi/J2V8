#!/bin/bash

# This file is the modified version of the one in node.js repository
# the only difference is that it actually works, so left it here till they
# accept fixes

# In order to cross-compile node for Android using NDK, run:
#   source android-configure <path_to_ndk> [arch]
#
# By running android-configure with source, will allow environment variables to
# be persistent in current session. This is useful for installing native node
# modules with npm. Also, don't forget to set the arch in npm config using
# 'npm config set arch=<arch>'


if [ -z "$2" ]; then
    ARCH=arm
else
    ARCH="$2"
fi

CC_VER="4.9"
case $ARCH in
    arm)
        DEST_CPU="${ARCH}"
        SUFFIX="$ARCH-linux-androideabi"
        TOOLCHAIN_NAME="$SUFFIX"
        ;;
    arm64)
        DEST_CPU="${ARCH}"
        SUFFIX="aarch64-linux-android"
        TOOLCHAIN_NAME="$SUFFIX"
        ;;
    x86)
        DEST_CPU="ia32"
        SUFFIX="i686-linux-android"
        TOOLCHAIN_NAME="$ARCH"
        ;;
    x86_64)
        DEST_CPU="ia32"
        SUFFIX="$ARCH-linux-android"
        TOOLCHAIN_NAME="$ARCH"
        ;;
    *)
        echo "Unsupported architecture provided: $ARCH"
        exit 1
        ;;
esac

export TOOLCHAIN=$PWD/android-toolchain
mkdir -p $TOOLCHAIN
$1/build/tools/make-standalone-toolchain.sh \
    --toolchain=$TOOLCHAIN_NAME-$CC_VER \
    --arch=$ARCH \
    --install-dir=$TOOLCHAIN \
    --platform=android-21
export PATH=$TOOLCHAIN/bin:$PATH
export AR=$TOOLCHAIN/bin/$SUFFIX-ar
export CC=$TOOLCHAIN/bin/$SUFFIX-gcc
export CXX=$TOOLCHAIN/bin/$SUFFIX-g++
export LINK=$TOOLCHAIN/bin/$SUFFIX-g++
export AR_host=ar
export CC_host=gcc
export CXX_host=g++
export LINK_host=g++

GYP_DEFINES="target_arch=$ARCH"
GYP_DEFINES+=" v8_target_arch=$ARCH"
GYP_DEFINES+=" android_target_arch=$ARCH"
GYP_DEFINES+=" host_os=linux OS=android"
export GYP_DEFINES

if [ -f "configure" ]; then
    ./configure \
        --dest-cpu=$DEST_CPU \
        --dest-os=android \
        --enable-static \
	    --with-intl=none \
        --without-snapshot \
        --openssl-no-asm
fi
