#!/bin/bash
sed -i -e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' */Makefile
sed -i -e 's?\.\./\.\./lang/golang/golang-package.mk?$(TOPDIR)/feeds/packages/lang/golang/golang-package.mk?' */Makefile

rm -rf luci-app-guest-wifi/po/zh_Hans/guest-wifi.po
mv luci-app-guest-wifi/po/zh_Hans/luci-app-guest-wifi.po luci-app-guest-wifi/po/zh_Hans/guest-wifi.po

bash diy/convert_translation.sh -a >/dev/null 2>&1

exit 0
