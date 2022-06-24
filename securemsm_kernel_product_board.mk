#Build ssg kernel driver
ENABLE_SECUREMSM_DLKM := false
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
ifeq ($(TARGET_KERNEL_DLKM_SECURE_MSM_OVERRIDE), true)
ENABLE_SECUREMSM_DLKM := true
endif
else
ENABLE_SECUREMSM_DLKM := true
endif

ifeq ($(ENABLE_SECUREMSM_DLKM), true)
PRODUCT_PACKAGES += smcinvoke_dlkm.ko
PRODUCT_PACKAGES += tz_log_dlkm.ko
PRODUCT_PACKAGES += qcedev-mod_dlkm.ko
PRODUCT_PACKAGES += qce50_dlkm.ko
PRODUCT_PACKAGES += qcrypto-msm_dlkm.ko
PRODUCT_PACKAGES += hdcp_qseecom_dlkm.ko
PRODUCT_PACKAGES += qrng_dlkm.ko
ifeq ($(TARGET_BOARD_AUTO),true)
PRODUCT_PACKAGES += qseecom_dlkm.ko
else
PRODUCT_PACKAGES += smcinvoke_dlkm.ko
endif #TARGET_BOARD_AUTO

endif #ENABLE_SECUREMSM_DLKM


