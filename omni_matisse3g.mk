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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common_tablet.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#LOCAL_KERNEL := device/samsung/matissewifi/kernel/kernel
#else
#LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel 

PRODUCT_COPY_FILES += \
	device/samsung/matissewifi/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
	device/samsung/matissewifi/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_NAME := omni_matissewifi
PRODUCT_DEVICE := matissewifi
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T531
PRODUCT_MANUFACTURER := Samsung
