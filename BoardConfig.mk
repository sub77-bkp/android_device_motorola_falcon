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


TARGET_OTA_ASSERT_DEVICE := xt1031,xt1032,xt1033,xt1034,falcon_umts,falcon_umtsds,falcon_cdma,falcon_retuaws,falcon,falcon_gpe

# Architecture
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_ARCH 						:= arm
TARGET_CPU_ABI 						:= armeabi-v7a
TARGET_CPU_ABI2 					:= armeabi
TARGET_ARCH_VARIANT 				:= armv7-a-neon
TARGET_CPU_VARIANT 					:= krait
ARCH_ARM_HAVE_TLS_REGISTER 			:= true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET 			:= true
TARGET_KRAIT_BIONIC_PLDOFFS 		:= 10
TARGET_KRAIT_BIONIC_PLDTHRESH 		:= 10
TARGET_KRAIT_BIONIC_BBTHRESH 		:= 64
TARGET_KRAIT_BIONIC_PLDSIZE 		:= 64

BOARD_CUSTOM_BOOTIMG_MK 			:= device/motorola/falcon/custombootimg.mk
TARGET_PREBUILT_KERNEL 				:= device/motorola/falcon/kernel/kernel

#TARGET_KERNEL_SOURCE := kernel/motorola/falcon
#TARGET_KERNEL_CONFIG := twrp-test_defconfig
#TARGET_KERNEL_VARIANT_CONFIG := msm8226-sec_falcon_defconfig
#BOARD_CUSTOM_BOOTIMG_MK := device/motorola/falcon/mkbootimg.mk
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0
#BOARD_KERNEL_BASE := 0x00000000
#BOARD_KERNEL_PAGESIZE := 2048
#BOARD_KERNEL_SEPARATED_DT := true
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100



TARGET_RECOVERY_FSTAB 				:= device/motorola/falcon/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT 		:= "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX		:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 		:= \"roboto_15x24.h\"
BOARD_SUPPRESS_SECURE_ERASE 		:= true
RECOVERY_GRAPHICS_USE_LINELENGTH 	:= true
RECOVERY_SDCARD_ON_DATA 			:= true
HAVE_SELINUX 						:= true

TW_THEME 							:= portrait_hdpi
DEVICE_RESOLUTION 					:= 720x1280
TW_NEW_ION_HEAP 					:= true
TW_BRIGHTNESS_PATH 					:= /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS 					:= 128

TW_IGNORE_MAJOR_AXIS_0 := true
TW_NO_USB_STORAGE := false
BOARD_HAS_NO_REAL_SDCARD := true
TW_SCREEN_BLANK_ON_BOOT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 5930614784
BOARD_FLASH_BLOCK_SIZE 				:= 131072
TARGET_USERIMAGES_USE_EXT4 			:= true
TARGET_USERIMAGES_USE_F2FS 			:= true

TW_INCLUDE_L_CRYPTO := true
#TW_CRYPTO_FS_TYPE := "ext4"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p26"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,journal_async_commit,errors=panic"
#TW_CRYPTO_FS_FLAGS := "0x00000406"
#TW_CRYPTO_KEY_LOC := "footer"

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/motorola/falcon/multirom/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_FONT := 160
MR_FSTAB := device/motorola/falcon/twrp.fstab
MR_KEXEC_MEM_MIN := 0x05000000
MR_KEXEC_DTB := true
MR_CONTINUOUS_FB_UPDATE := true

