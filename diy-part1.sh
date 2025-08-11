#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# Add aliddns
mkdir -p package/feeds
git clone https://github.com/honwen/luci-app-aliddns.git package/feeds/luci-app-aliddns
pushd package/feeds/luci-app-aliddns/tools/po2lmo
make && sudo make install
popd
sed -i '/^#src-git helloworld/s/^#//' feeds.conf.default
