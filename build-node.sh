#!/bin/bash

if [[ -z "$ANDROID_NDK" ]]; then
    echo 'Cannot find android ndk, please set ANDROID_NDK'
    exit 1;
fi

git clone https://github.com/nodejs/node.git
cd node
git checkout ce8753a

# remove this when node fix is ready
cp ../node-configs/* ./

# configure for arm
source android-configure.sh "${ANDROID_NDK}" arm
make CCFLAGS="-fPIC" CXXFLAGS="-fPIC" CPPFLAGS="-fPIC" -j8
mv out out-armeabi-v7a
ln -s out-armeabi-v7a out-armeabi

# configure for arm64
source android-configure.sh "${ANDROID_NDK}" arm64
make CCFLAGS="-fPIC" CXXFLAGS="-fPIC" CPPFLAGS="-fPIC" -j8
mv out out-arm64-v8a

cd ..
