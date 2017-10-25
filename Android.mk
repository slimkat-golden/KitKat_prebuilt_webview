#
# Prebuild libwebviewchromium.so for KitKat
#
# generating webview from external/chromium_org 
# takes ages in a KitKat build tree - so this is a short cut
# to use the generated webview stuff as a prebuilt
#

#Only execute, if prebuilt webview has been specified
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)

LOCAL_PATH := $(call my-dir)

# Prebuilt KitKat webview
include $(CLEAR_VARS)
LOCAL_MODULE := libwebviewchromium
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := lib/libwebviewchromium.so
LOCAL_MODULE_TAGS := optional 
include $(BUILD_PREBUILT)

# Needed by frameworks/webview to generate "glue" libs
include $(CLEAR_VARS)
LOCAL_MODULE := android_webview_java
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_COMMON_INTERMEDIATES)
LOCAL_SRC_FILES := lib/android_webview_java.jar
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# PAK files (language support etc.)
$(shell mkdir -p $(TARGET_OUT)/framework/webview/paks)
$(shell cp -r $(LOCAL_PATH)/framework/webview/paks/* $(TARGET_OUT)/framework/webview/paks)

endif
