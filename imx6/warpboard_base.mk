# This is the WaRP Android Reference Design platform
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)
$(call inherit-product-if-exists,hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

ifneq ($(wildcard device/fsl/evk_6dq/fstab_nand.freescale),)
$(shell touch device/fsl/evk_6sl/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/evk_6dq/fstab.freescale),)
$(shell touch device/fsl/evk_6sl/fstab.freescale)
endif

# Overrides
PRODUCT_DEVICE := warp

PRODUCT_COPY_FILES += \
	device/fsl/warp/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/common/input/imx-keypad.idc:system/usr/idc/imx-keypad.idc \
	device/fsl/common/input/imx-keypad.kl:system/usr/keylayout/imx-keypad.kl \
	device/fsl/warp/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/warp/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/fsl/common/media_codecs.xml:system/etc/media_codecs.xml \
	device/fsl/warp/wifi/warp_v1_bcmdhd.cal:system/etc/wifi/bcmdhd.cal

DEVICE_PACKAGE_OVERLAYS := device/fsl/warp/overlay

PRODUCT_CHARACTERISTICS := default

PRODUCT_AAPT_CONFIG += small hdpi

PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif
