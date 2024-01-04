#!/bin/bash
# =========================================
# Auther  : givpn
# =========================================
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
y="\033[0;1;37m"
wh="\033[0m"
# Getting
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$y            ตั้งค่า DNS$wh"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e ""
echo -e "Active DNS : $udns"
fi
echo -e ""
echo -e " [\e[36m•1\e[0m] เปลี่ยน DNS"
echo -e " [\e[36m•2\e[0m] รีเซ็ตค่าเดิมของ DNS"
echo -e " [\e[36m•3\e[0m] กลับไปยังเมนูหลัก"
echo -e ""
read -p "โปรดเลือก [ 1 - 3 ] :  " dns
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
case $dns in
1)
clear
echo ""
read -p "กรุณาใส่ DNS : " dns1
if [ -z $dns1 ]; then
echo ""
echo "กรุณาใส่ DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
rm /etc/resolvconf/resolv.conf.d/head
touch /etc/resolv.conf
touch /etc/resolvconf/resolv.conf.d/head
echo "$dns1" > /root/dns
echo "nameserver $dns1" >> /etc/resolv.conf
echo "nameserver $dns1" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns1 เปลี่ยนแปลงสำเร็จ\e[0m"
echo ""
cat /etc/resolvconf/resolv.conf.d/head
sleep 1
clear
dns
;;
2)
clear
echo ""
read -p "รีเซ็ตค่าเดิม [Y/N]: " -e answer
if [ "$answer" = 'y' ] || [ "$answer" = 'Y' ]; then
rm /root/dns
echo ""
echo -e "[ ${GREEN}INFO${NC} ] Delete Resolv.conf DNS"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 1
echo -e "[ ${GREEN}INFO${NC} ] Delete Resolv.conf.d/head DNS"
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 1
else if [ "$answer" = 'n' ] || [ "$answer" = 'N' ]; then
echo -e ""
echo -e "[ ${GREEN}INFO${NC} ]  Operation Cancelled By User"
sleep 1
fi
fi
clear
dns
;;
3)
clear
menu
;;
*)
echo "โปรดเลือกให้ถูกต้อง"
clear
dns
;;
esac
