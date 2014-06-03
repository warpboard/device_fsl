$(call inherit-product, device/fsl/imx6/warpboard_base.mk)

# Overrides
PRODUCT_NAME := warpboard

PRODUCT_COPY_FILES += \
	device/fsl/imx6/etc/init.rc:root/init.rc \
	device/fsl/warp/init.rc:root/init.freescale.rc
