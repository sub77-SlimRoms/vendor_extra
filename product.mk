########################################
############## Packages ################
########################################

# ADB
PRODUCT_COPY_FILES += \
    vendor/extra/products/common/rootdir/adbkey.pub:root/adb_keys

# Add prebuilt packages
PRODUCT_PACKAGES += \
    Mixplorer \
    Substratum

# Add wanted packages
PRODUCT_PACKAGES += \
    LockClock

# OpenDelta OTA
#PRODUCT_PACKAGES += \
#    OpenDelta

########################################
############# Settings #################
########################################

# Updates overlay settings
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay/common
