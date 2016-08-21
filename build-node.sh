git clone https://github.com/nodejs/node.git

# remove this when node fix is ready
cp node-configs/* node/

cd node
# configure for arm
source android-configure.sh "${ANDROID-NDK}" arm
make CCFLAGS="-fPIC" CXXFLAGS="-fPIC" CPPFLAGS="-fPIC" -j8
mv out out-armeabi-v7a
ln -s out-armeabi-v7a out-armeabi

# configure for arm64
source android-configure.sh "${ANDROID-NDK}" arm64
make CCFLAGS="-fPIC" CXXFLAGS="-fPIC" CPPFLAGS="-fPIC" -j8
mv out out-arm64-v8a

cd ..
