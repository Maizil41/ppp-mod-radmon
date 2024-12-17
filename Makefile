# This is free software, licensed under the GNU General Public License v2.0
#
# Copyright (C) 2024 Maizil <https://github.com/maizil41>

include $(TOPDIR)/rules.mk

PKG_NAME:=ppp-mod-radmon
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Maizil <https://github.com/maizil41>
PKG_LICENSE:=GPL-2.0
PKG_ARCH:=all
PKG_CATEGORY:=Network

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=PPPoE Mod For RadMonv2.
  DEPENDS:=+rp-pppoe-common +rp-pppoe-server +ppp-mod-radius
endef

define Package/$(PKG_NAME)/description
  This package contains a RadMonv2 PPPoE support.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/99-ppp-mod-radmon $(1)/etc/uci-defaults/99-ppp-mod-radmon
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
