# Get android-ndk somehow
# I recommend getting the one with V8, because it works well
# here how you can get it

# Install depot_tools
# git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
# export PATH=`pwd`/depot_tools:"$PATH"

# Then get v8
# fetch v8

# then to actually get ndk (this will run pretty long) - it'll download approx 8gb
# cd v8
# echo "target_os = ['android']" >> ../.gclient && gclient sync --nohooks

# then declare
# export ANDROID_NDK=/full/path/to/v8/third_party/android_tools/ndk

# This will not run properly if ANDROID_NDK is not set up

export PATH="${ANDROID_NDK}:${PATH}"
./build-node.sh

ndk-build

mkdir -p libs/armeabi libs/armeabi-v7a libs/arm64-v8a
cp jni/libj2v8_android_armeabi.so libs/armeabi/libj2v8.so
cp jni/libj2v8_android_armeabi-v7a.so libs/armeabi-v7a/libj2v8.so
cp jni/libj2v8_android_arm64-v8a.so libs/arm64-v8a/libj2v8.so

# do not build as test cannot be run on host
./gradlew clean assemble

# your libs in build/outputs/aar/
