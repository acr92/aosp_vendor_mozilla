LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Firefox
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := Browser Browser2
LOCAL_SRC_FILES := Firefox.apk
LOCAL_REQUIRED_MODULES := PartnerBookmarkProvider BookmarksProvider
LOCAL_MODULE_TARGET_ARCH := arm64
LOCAL_MULTILIB := both

# These needs to be extracted, since the Firefox loader expects them to be in /system/app/Firefox/lib
LOCAL_POST_INSTALL_CMD = \
	rm -rf $(dir $(LOCAL_INSTALLED_MODULE))/lib; \
	unzip -qq -o -d $(dir $(LOCAL_INSTALLED_MODULE)) $(LOCAL_BUILT_MODULE) 'lib/arm64-v8a/*.so'; \
	mv $(dir $(LOCAL_INSTALLED_MODULE))/lib/arm64-v8a $(dir $(LOCAL_INSTALLED_MODULE))/lib/arm64

include $(BUILD_PREBUILT)
