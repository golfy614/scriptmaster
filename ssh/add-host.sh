#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "ตรวจสอบระบบ"
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "โดเมน: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "กดปุ่มใดก็ได้เพื่อย้อนกลับไปยังเมนู"
menu
else
echo "IP=$host" > /var/lib/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "อย่าลืมต่ออายุใบอนุญาต"
echo ""
read -n 1 -s -r -p "กดปุ่มใดก็ได้เพื่อย้อนกลับไปยังเมนู"
menu
fi
