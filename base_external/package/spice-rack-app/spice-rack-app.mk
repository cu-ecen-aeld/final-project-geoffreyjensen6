
##############################################################
#
# SPICE_RACK_APP
#
##############################################################

SPICE_RACK_APP_VERSION = '03d44419e23b248fcde1824cca7fb3c029607b0c'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
SPICE_RACK_APP_SITE = 'git@github.com:geoffreyjensen6/final-project-spice-rack-app.git'
SPICE_RACK_APP_SITE_METHOD = git
SPICE_RACK_APP_GIT_SUBMODULES = YES

define SPICE_RACK_APP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) 
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
endef

define SPICE_RACK_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/ $(TARGET_DIR)/usr/bin/spice_rack
	$(INSTALL) -m 0755 $(@D)/spice_conversions.csv $(TARGET_DIR)/usr/bin/spice_rack/spice_conversions.csv
	$(INSTALL) -m 0755 $(@D)/spice_rack_app $(TARGET_DIR)/usr/bin/spice_rack/spice_rack_app
	$(INSTALL) -m 0755 $(@D)/spice-rack-start-stop $(TARGET_DIR)/etc/init.d/S983SpiceRackApp
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket_server $(TARGET_DIR)/usr/bin/spice_rack/aesdsocket_server
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S984aesdsocket_server
endef

$(eval $(generic-package))
