$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_COPY_FILES += \
    device/samsung/matisse/kernel:kernel \
    device/samsung/matisse/dt.img:dt.img

#PRODUCT_DEVICE := falcon
#PRODUCT_MODEL := MOTO G
PRODUCT_NAME := omni_falcon
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
