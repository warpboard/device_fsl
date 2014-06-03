$(call inherit-product, device/fsl/imx6/warpboard_base.mk)

# Overrides
PRODUCT_NAME := warpboard_nfs

PRODUCT_COPY_FILES += \
	device/fsl/imx6/etc/init-nfs.rc:root/init.rc \
	device/fsl/warp/init-nfs.rc:root/init.freescale.rc
