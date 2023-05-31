
##############################################################
#
# FSR
#
##############################################################

FSR_VERSION = b7a0e3bb28a312d483378792132a64b4950b14c4
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
FSR_SITE = git@github.com:geoffreyjensen6/final-project-fsr-driver.git
FSR_SITE_METHOD = git
FSR_GIT_SUBMODULES = YES
#FSR_MODULE_SUBDIRS = fsr_driver
FSR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

#define FSR_BUILD_CMDS
#        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/test_script
#endef

#define FSR_INSTALL_TARGET_CMDS
#        $(INSTALL) -m 0755 $(@D)/test_script/test_file $(TARGET_DIR)/etc/
#endef


$(eval $(kernel-module))
$(eval $(generic-package))

