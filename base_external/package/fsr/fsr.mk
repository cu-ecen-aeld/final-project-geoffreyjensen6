
##############################################################
#
# FSR
#
##############################################################

FSR_VERSION = '74a8658abb816f35c765cd38ffa4f61ec8254b67'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
FSR_SITE = 'git@github.com:geoffreyjensen6/final-project-fsr-driver.git'
FSR_SITE_METHOD = git
FSR_GIT_SUBMODULES = YES
FSR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define FSR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/fsr-module-start-stop $(TARGET_DIR)/etc/init.d/S982fsrmodule
endef

$(eval $(kernel-module))
$(eval $(generic-package))

