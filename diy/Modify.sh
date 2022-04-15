#!/bin/bash
sed -i \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

rm -rf applications/luci-app-guest-wifi/po/zh_Hans/guest-wifi.po
mv applications/luci-app-guest-wifi/po/zh_Hans/luci-app-guest-wifi.po applications/luci-app-guest-wifi/po/zh_Hans/guest-wifi.po

bash diy/convert_translation.sh -a >/dev/null 2>&1

exit 0
