#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/360T7/g' package/base-files/files/bin/config_generate

# 修改插件名字
sed -i 's/"Release Ram"/"内存释放"/g' `egrep "Release Ram" -rl ./`
sed -i 's/"Custom Commands"/"命令脚本"/g' `egrep "Custom Commands" -rl ./`
sed -i 's/"Scheduled Reboot"/"定时重启"/g' `egrep "Scheduled Reboot" -rl ./`
sed -i 's/"Argon Config"/"主题设置"/g' `egrep "Argon Config" -rl ./`
sed -i 's/"Wake on LAN"/"网络唤醒"/g' `egrep "Wake on LAN" -rl ./`
sed -i 's/"v2rayA"/"v2ray客服端"/g' `egrep "v2rayA" -rl ./`
sed -i 's/"DDNS-Go"/"动态域名解析"/g' `egrep "DDNS-Go" -rl ./`
