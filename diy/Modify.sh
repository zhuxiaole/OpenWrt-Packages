#!/bin/bash
sed -i \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

bash diy/convert_translation.sh -a >/dev/null 2>&1

exit 0
