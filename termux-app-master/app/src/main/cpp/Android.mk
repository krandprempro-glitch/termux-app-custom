LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libtermux-bootstrap
LOCAL_SRC_FILES := termux-bootstrap-zip.S termux-bootstrap.c

# تحديد مسار ملف bootstrap
LOCAL_CFLAGS := -DTERMUX_BOOTSTRAP_FILE=\"bootstrap-aarch64.zip\"

# تحسينات للمعمارية
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
    LOCAL_ARM_NEON := true
    LOCAL_CFLAGS += -D__ARM64__
endif

include $(BUILD_SHARED_LIBRARY)

# تضمين ملف bootstrap في الأصول
$(call add-custom-command,cp $(LOCAL_PATH)/bootstrap-aarch64.zip $(TARGET_OUT)/assets/,Copying bootstrap)