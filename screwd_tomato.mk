# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, device/yu/tomato/full_tomato.mk)

# Inherit some common LiquidRemix stuff.
$(call inherit-product, vendor/screwd/main.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8939

PRODUCT_NAME := screwd_tomato
BOARD_VENDOR := yu
PRODUCT_DEVICE := tomato

PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Phenomenall (venkysai)"

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2016-05-01

PRODUCT_GMS_CLIENTID_BASE := android-micromax
# Boot Animation Res
TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="YUREKA-user 5.1.1 LMY49J YOG4PAS8A4 release-keys" \
    PRODUCT_NAME=YUREKA \
    TARGET_DEVICE=YUREKA

BUILD_FINGERPRINT := YU/YUREKA/YUREKA:5.1.1/LMY49J/YOG4PAS8A4:user/release-keys
