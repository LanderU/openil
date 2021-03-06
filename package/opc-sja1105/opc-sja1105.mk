OPC_SJA1105_VERSION = 0.0.1
OPC_SJA1105_SITE = package/opc-sja1105/src
OPC_SJA1105_SITE_METHOD = local
OPC_SJA1105_LICENSE = BSD-3c
OPC_SJA1105_LICENSE_FILES = COPYING
OPC_SJA1105_DEPENDENCIES = sja1105-tool libopen62541

define OPC_SJA1105_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
		CFLAGS+="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS+="-L$(STAGING_DIR)/usr/lib"
endef

define OPC_SJA1105_INSTALL_TARGET_CMDS
	DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install;
endef

$(eval $(generic-package))
