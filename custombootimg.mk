DTB := device/motorola/falcon/kernel/dtb
CMD := "console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0"
#CMD := "console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0 zcache androidboot.selinux=permissive"

LZMA_RAMDISK := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img

$(LZMA_RAMDISK): $(recovery_ramdisk)
	 gunzip -f < $(recovery_ramdisk) | lzma -e > $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(LZMA_RAMDISK) \
		$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG) --kernel $(PRODUCT_OUT)/kernel --ramdisk $(LZMA_RAMDISK) --cmdline $(CMD) --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x01000000 --dt $(DTB) --tags_offset 0x00000100 --output $(PRODUCT_OUT)/recovery.img
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	#$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)


