# Recovery
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# TWRP-Specific
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 178
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd hwservicemanager keymaster-3-0
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_MTP := true

# Correct time
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_DEVICE_MODULE := tzdata
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/usr/share/zoneinfo/tzdata

# Remove cursor
TW_INPUT_BLACKLIST := "hbtp_vm"

# Extra configurations
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_SUPERSU := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Fix access denied issue
BOARD_SEPOLICY_DIRS += device/asus/Z01Q/sepolicy

# Fix error using mke2fs
TW_RECOVERY_ADDITIONAL_RELINK_FILES := \
    $(OUT)/system/lib64/libext2_misc.so

# For decrypting /data, we need to hack recovery.img and inject new os and
# security version
BOARD_CUSTOM_BOOTIMG_MK := device/asus/Z01Q/boot.mk
