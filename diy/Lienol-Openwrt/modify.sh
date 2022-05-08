#!/bin/bash
sed -i -e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' */Makefile
sed -i -e 's?\.\./\.\./lang/golang/golang-package.mk?$(TOPDIR)/feeds/packages/lang/golang/golang-package.mk?' */Makefile

mkdir -p luci-app-wizard/patches
cp $GITHUB_WORKSPACE/diy/Lienol-Openwrt/patches/luci-app-wizard/* luci-app-wizard/patches

sed -i 's|"admin", "services", "wolplus"|"admin", "control", "wolplus"|g' luci-app-wolplus/luasrc/controller/wolplus.lua
sed -i "s|[[services]]|[[control]]|g" luci-app-wolplus/luasrc/view/wolplus/index.htm

bash $GITHUB_WORKSPACE/diy/common/convert_translation.sh -a >/dev/null 2>&1

echo `date +"%Y-%m-%d %H:%M:%S"` > version

exit 0
