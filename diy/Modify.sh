#!/bin/bash
sed -i \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

sed -i 's|msgstr"创建/删除"|msgstr "创建/删除"|g' luci-app-guest-wifi/po/zh-cn/guest-wifi.po

bash diy/convert_translation.sh -a >/dev/null 2>&1

exit 0
