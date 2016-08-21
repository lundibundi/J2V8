LOCAL_PATH := $(call my-dir)
LOCAL_MULTILIB := "both"

include $(CLEAR_VARS)
LOCAL_MODULE	:= node
LOCAL_SRC_FILES := ../node/out-$(TARGET_ARCH_ABI)/Release/libnode.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= v8_base
#LOCAL_SRC_FILES := ../support/android/libs/libv8_base.arm.a
#LOCAL_SRC_FILES := ../libv8_base.arm.a
#LOCAL_SRC_FILES := /data/jenkins/v8_3_26/out/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_base.$(TARGET_ARCH_ABI).a
#LOCAL_SRC_FILES := /data/jenkins/v8/out/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_base.a
LOCAL_SRC_FILES := ../node/out-$(TARGET_ARCH_ABI)/Release/libv8_base.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= v8_libbase
#LOCAL_SRC_FILES := ../support/android/libs/libv8_base.arm.a
#LOCAL_SRC_FILES := /data/jenkins/v8_3_26/out/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_base.$(TARGET_ARCH_ABI).a
#LOCAL_SRC_FILES := /data/jenkins/v8/out/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_libbase.a
LOCAL_SRC_FILES := ../node/out-$(TARGET_ARCH_ABI)/Release/libv8_libbase.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= v8_libplatform
#LOCAL_SRC_FILES := ../support/android/libs/libv8_base.arm.a
#LOCAL_SRC_FILES := /data/jenkins/v8_3_26/out-$(TARGET_ARCH_ABI)/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_base.$(TARGET_ARCH_ABI).a
#LOCAL_SRC_FILES := /data/jenkins/v8/out-$(TARGET_ARCH_ABI)/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_libplatform.a
LOCAL_SRC_FILES := ../node/out-$(TARGET_ARCH_ABI)/Release/libv8_libplatform.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= v8_nosnapshot
#LOCAL_SRC_FILES :=  ../support/android/libs/libv8_nosnapshot.arm.a
#LOCAL_SRC_FILES :=  /data/jenkins/v8/out-$(TARGET_ARCH_ABI)/android_$(TARGET_ARCH_ABI).release/obj.target/tools/gyp/libv8_nosnapshot.a
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libv8_nosnapshot.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= uv
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libuv.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= openssl
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libopenssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= http_parser
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libhttp_parser.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= gtest
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libgtest.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= zlib
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libzlib.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= cares
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libcares.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= v8_inspector_stl
LOCAL_SRC_FILES :=  ../node/out-$(TARGET_ARCH_ABI)/Release/libv8_inspector_stl.a
include $(PREBUILT_STATIC_LIBRARY)

#include $(CLEAR_VARS)
#LOCAL_MODULE	:= icuucx
#LOCAL_SRC_FILES :=  ../node/out/Release/libicuucx.a
##LOCAL_SRC_FILES :=  /data/jenkins/v8_3_26/out/android_arm.release/obj.target/tools/gyp/libicuuc.a
#include $(PREBUILT_STATIC_LIBRARY)
#
#include $(CLEAR_VARS)
#LOCAL_MODULE	:= icudata
#LOCAL_SRC_FILES :=  ../node/out/Release/libicudata.a
#include $(PREBUILT_STATIC_LIBRARY)
#
#include $(CLEAR_VARS)
#LOCAL_MODULE	:= icui18n
#LOCAL_SRC_FILES :=  ../node/out/Release/libicui18n.a
#include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := j2v8_android_$(TARGET_ARCH_ABI)
LOCAL_SRC_FILES := com_eclipsesource_v8_V8Impl.cpp
LOCAL_C_INCLUDES := /home/lundibundi/dev/J2V8/node /home/lundibundi/dev/J2V8/node/deps/v8 /home/lundibundi/dev/J2V8/node/deps/v8/include /home/lundibundi/dev/J2V8/node/src /home/lundibundi/dev/J2V8/node/deps/v8/src/base
LOCAL_CFLAGS += -std=c++11 -Wall -Wno-unused-function -Wno-unused-variable -O3 -funroll-loops -ftree-vectorize -ffast-math -fpermissive -fPIC -DNODE_COMPATIBLE
LOCAL_WHOLE_STATIC_LIBRARIES := node v8_libbase
LOCAL_STATIC_LIBRARIES := v8_base v8_libplatform v8_nosnapshot uv openssl http_parser gtest zlib cares v8_inspector_stl
LOCAL_LDFLAGS += -L$(ANDROID_NDK)/sources/cxx-stl/gnu-libstdc++/4.9/libs/$(TARGET_ARCH_ABI)
LOCAL_LDLIBS += -L$(SYSROOT)/usr/lib -llog -latomic 
include $(BUILD_SHARED_LIBRARY)
