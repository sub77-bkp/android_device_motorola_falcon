$(call inherit-product, device/motorola/falcon/full_falcon.mk)

# Inherit some common SlimSaber stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := slim_falcon
