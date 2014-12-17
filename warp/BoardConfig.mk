#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/soc/imx6sl.mk
include device/fsl/warp/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
-include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# warp default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

ifeq ($(BUILD_TARGET_FS),ubifs)
TARGET_RECOVERY_FSTAB = device/fsl/warp/fstab_nand.freescale
# build ubifs for nand devices
PRODUCT_COPY_FILES +=	\
	device/fsl/warp/fstab_nand.freescale:root/fstab.freescale
else
TARGET_RECOVERY_FSTAB = device/fsl/warp/fstab.freescale
# build for ext4
PRODUCT_COPY_FILES +=	\
	device/fsl/warp/fstab.freescale:root/fstab.freescale
endif # BUILD_TARGET_FS

TARGET_BOOTLOADER_BOARD_NAME := WaRP
PRODUCT_MODEL := WaRP

# Install touchscreen configuration file
PRODUCT_COPY_FILES +=   \
	device/fsl/common/input/eGalax_Touch_Screen.idc:system/usr/idc/ft5x06.idc

# UNITE is a virtual device support both atheros and realtek wifi(ar6103 and rtl8723as)
#BOARD_WLAN_DEVICE            := UNITE
#WPA_SUPPLICANT_VERSION       := VER_0_8_UNITE
#TARGET_KERNEL_MODULES        := \
#                                kernel_imx/drivers/net/wireless/rtl8723as/8723as.ko:system/lib/modules/8723as.ko \
#                                kernel_imx/net/wireless/cfg80211.ko:system/lib/modules/cfg80211_realtek.ko
#BOARD_WPA_SUPPLICANT_DRIVER  := NL80211
#BOARD_HOSTAPD_DRIVER         := NL80211

#BOARD_HOSTAPD_PRIVATE_LIB_QCOM              := lib_driver_cmd_qcwcn
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB_QCOM       := lib_driver_cmd_qcwcn
#BOARD_HOSTAPD_PRIVATE_LIB_RTL               := lib_driver_cmd_rtl
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB_RTL        := lib_driver_cmd_rtl

# BROADCOM defines for BCM4330-based module --- type SH
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
TARGET_KERNEL_MODULES            := kernel_imx/drivers/net/wireless/bcmdhd/bcmdhd.ko:system/lib/modules/bcmdhd.ko

BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_HOSTAPD_DRIVER             := NL80211

BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/wifi/bcmdhd.cal iface_name=wlan0"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/vendor/firmware/fw_bcmdhd_apsta.bin nvram_path=/system/etc/wifi/bcmdhd.cal iface_name=wlan0"
WIFI_BAND                        := 802_11_BG

#for intel vendor
ifeq ($(BOARD_WLAN_VENDOR),INTEL)
BOARD_HOSTAPD_PRIVATE_LIB                := private_lib_driver_cmd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB         := private_lib_driver_cmd
WPA_SUPPLICANT_VERSION                   := VER_0_8_X
HOSTAPD_VERSION                          := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB         := private_lib_driver_cmd_intel
WIFI_DRIVER_MODULE_PATH                  := "/system/lib/modules/iwlagn.ko"
WIFI_DRIVER_MODULE_NAME                  := "iwlagn"
WIFI_DRIVER_MODULE_PATH                  ?= auto
endif

BOARD_MODEM_VENDOR := AMAZON

USE_ATHR_GPS_HARDWARE := false
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true

# for recovery service
TARGET_SELECT_KEY := 28
# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# atheros 3k BT
BOARD_USE_AR3K_BLUETOOTH := false

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := false

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

TARGET_KERNEL_DEFCONF := imx6sl_warp_android_defconfig
BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init androidboot.console=ttymxc0 androidboot.hardware=freescale csi ft5x06_ts.calibration=65536,0,0,0,65536,0,79136
TARGET_BOOTLOADER_CONFIG := mx6sl:warpandroid_config
