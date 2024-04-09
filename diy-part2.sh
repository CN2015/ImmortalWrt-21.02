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

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# 时区
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# 
MTK_HNAT(){
  rm -rf target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  mv mtk_hnat target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
}

MT_WIFI(){
  rm -rf package/mtk/drivers/mt_wifi
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/package/mtk/drivers/mt_wifi
  mv mt_wifi package/mtk/drivers/mt_wifi
}

MTK_HNAT
echo '-------------------------------------------------------------------------------------------------'
MT_WIFI

# 修改插件名字
sed -i 's/"Release Ram"/"内存释放"/g' `egrep "Release Ram" -rl ./`
sed -i 's/"Custom Commands"/"命令脚本"/g' `egrep "Custom Commands" -rl ./`
sed -i 's/"Scheduled Reboot"/"定时重启"/g' `egrep "Scheduled Reboot" -rl ./`
sed -i 's/"Argon Config"/"主题设置"/g' `egrep "Argon Config" -rl ./`
sed -i 's/"Wake on LAN"/"网络唤醒"/g' `egrep "Wake on LAN" -rl ./`
sed -i 's/"v2rayA"/"v2ray客服端"/g' `egrep "v2rayA" -rl ./`
sed -i 's/"DDNS-Go"/"动态域名"/g' `egrep "DDNS-Go" -rl ./`
sed -i 's/"备份与升级"/"系统升级"/g' `egrep "备份与升级" -rl ./`

