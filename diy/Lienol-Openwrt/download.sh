#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd $GITHUB_WORKSPACE/$REPO_BRANCH
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth 1 https://github.com/Ausaci/luci-app-nat6-helper
git clone --depth 1 https://github.com/tty228/luci-app-serverchan
git clone --depth 1 https://github.com/ntlf9t/luci-app-easymesh
git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall passwall-pkgs && rm -rf passwall-pkgs/.github && mv -n passwall-pkgs/* ./ && rm -rf passwall-pkgs && rm -rf xray-core
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall-luci && mv -n passwall-luci/luci-app-passwall ./ && rm -rf passwall-luci
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config

git_sparse_clone openwrt-21.02 "https://github.com/immortalwrt/luci" "airplay2_luci" applications/luci-app-airplay2
git_sparse_clone master "https://github.com/kiddin9/openwrt-packages" "wizard_luci" luci-app-wizard
git_sparse_clone openwrt-21.02 "https://github.com/immortalwrt/luci" "eqos_luci" applications/luci-app-eqos
git_sparse_clone master "https://github.com/sundaqiang/openwrt-packages" "wolplus_luci" luci-app-wolplus
git_sparse_clone openwrt-21.02 "https://github.com/immortalwrt/luci" "accesscontrol_luci" applications/luci-app-accesscontrol
git_sparse_clone 22.03 "https://github.com/x-wrt/com.x-wrt" "natflow_pkg" natflow
git_sparse_clone 22.03 "https://github.com/x-wrt/com.x-wrt" "natflow_users_luci" luci-app-natflow-users
git_sparse_clone 22.03 "https://github.com/x-wrt/com.x-wrt" "lua_ipops_pkg" lua-ipops

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

exit 0

