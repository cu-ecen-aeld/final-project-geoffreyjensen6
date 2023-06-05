
##############################################################
#
# SPICE_RACK_APP
#
##############################################################

SPICE_RACK_APP_VERSION = 'd2b0bcf00695caf11b68cfe43369275b0561548d'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
SPICE_RACK_APP_SITE = 'git@github.com:geoffreyjensen6/final-project-spice-rack-app.git'
SPICE_RACK_APP_SITE_METHOD = git
SPICE_RACK_APP_GIT_SUBMODULES = YES

define SPICE_RACK_APP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) 
endef

define SPICE_RACK_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/spice_rack_app $(TARGET_DIR)/etc/spice_rack_app
endef

$(eval $(generic-package))
