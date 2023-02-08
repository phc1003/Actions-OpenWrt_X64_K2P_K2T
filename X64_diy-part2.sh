#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.199.201/g' package/base-files/files/bin/config_generate

rm -rf  feeds/luci/themes/luci-theme-argon

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

sed -i '/uci commit system/i\uci set system.@system[0].hostname='X86'' package/lean/default-settings/files/zzz-default-settings

sed -i "s/OpenWrt /OpenWrt/g" package/lean/default-settings/files/zzz-default-settings

git clone --branch master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/lean/luci-app-unblockneteasemusic
