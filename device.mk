#
# Copyright (C) 2016 The CyanogenMod Project
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
#

# Inherit from msm8916-common
$(call inherit-product, device/cyanogen/msm8916-common/msm8916.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Due to multi-density builds, these are set by init
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.model ro.sf.lcd_density

# Include package config fragments
include $(LOCAL_PATH)/product/*.mk

# Call the proprietary setup
$(call inherit-product, vendor/yu/tomato/tomato-vendor.mk)

PRODUCT_PACKAGES +=\
MiXplorer \
NexusLauncher

PRODUCT_COPY_FILES +=\
 $(LOCAL_PATH)/yl_params/extra/lib/arm/libbass.so:/system/app/MusicPlayer/lib/arm/libbass.so \
 $(LOCAL_PATH)/yl_params/extra/lib/arm/libbassflac.so:/system/app/MusicPlayer/lib/arm/libbassflac.so \
 $(LOCAL_PATH)/yl_params/extra/lib/arm/libbass_fx.so:/system/app/MusicPlayer/lib/arm/libbass_fx.so \
 $(LOCAL_PATH)/yl_params/extra/lib/arm/libbassmix.so:/system/app/MusicPlayer/lib/arm/libbassmix.so \
 $(LOCAL_PATH)/yl_params/extra/lib/arm/libbass_aac.so:/system/app/MusicPlayer/lib/arm/libbass_aac.so

# Healthd packages
PRODUCT_PACKAGES += \
cm_charger_res_images \
font_log.png \
libhealthd.cm

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0
    
#Maintainer 
PRODUCT_PROPERTY_OVERRIDES += \
ro.aos.maintainer=AshishSharma

# OTA Configs
PRODUCT_PROPERTY_OVERRIDES += \
ro.ota.romname=Atomic-OS \
ro.ota.version=$(shell date +"%Y%m%d") \
ro.ota.manifest= https://raw.githubusercontent.com/TeamDarkness-Devices/ota_devices/master/tomato.xml
