
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '9c16acf662a19e0a1cd47fb1f0f478dd2403dc15'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Quaso2222.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app 
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/finder-app/writer  $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket   $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/conf/
	cp -dpR $(@D)/conf/* $(TARGET_DIR)/usr/conf/
	cp $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	cp $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	cp $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

$(eval $(kernel-module))
$(eval $(generic-package))
