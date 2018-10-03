#
# Copyright (C) 2018 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#include common tree stuff
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/yu/tomato


# Assertions
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Inherit from proprietary files
include vendor/yu/tomato/BoardConfigVendor.mk

#Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
USE_LEGACY_LOCAL_AUDIO_HAL := true

#Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

#Camera
BOARD_CAMERA_SENSORS := imx135_cp8675 imx214_cp8675 ov5648_cp8675
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true

#Dexpreopt
WITH_DEXPREOPT := false
DONT_DEXPREOPT_PREBUILTS := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true

#Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13576175616 # 13576192000 - 16384
# Use mke2fs instead of make_ext4fs
TARGET_USES_MKE2FS := true

#Gps
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := $(DEVICE_PATH)/init/init_tomato.cpp

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_CONFIG := lineageos_tomato_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-opt-linux-android/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-opt-linux-android-

#Libshims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib64/libflp.so|libshims_flp.so \
    /system/vendor/lib64/libizat_core.so|libshims_get_process_name.so \
    /system/vendor/lib/libflp.so|libshims_flp.so \
    /system/vendor/lib/libizat_core.so|libshims_get_process_name.so

#Lights
BOARD_LIGHTS_VARIANT := aw2013
TARGET_PROVIDES_LIBLIGHT := true

# LineageHW
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/lineagehw

#Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Power
TARGET_POWER_SET_FEATURE_LIB := libpower_set_feature_tomato

#HALS Varriant
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8916
TARGET_QCOM_AUDIO_VARIANT := caf-msm8916
TARGET_QCOM_MEDIA_VARIANT := caf-msm8916

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

#Boot Animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

#TWRP
ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp
TW_INCLUDE_CRYPTO := true
TW_THEME := portrait_hdpi
endif

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

#WIFI
# Wifi CONFIG_EAP_PROXY := qmi
#CONFIG_EAP_PROXY_DUAL_SIM := true
TARGET_PROVIDES_WCNSS_QMI := true
# The uncompressed arm64 is too large, split wifi for now
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME := "wlan"
