#!/bin/bash
chmod +x . ./devices/nexus7/ubuntu/*.sh
chmod +x . ./devices/nexus7/android/*.sh
clear
echo ""
echo "Nexus 7 2013 WiFi - flo"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Screencast"
echo ""
echo ""
echo "Android"
echo "[3] Install Factory Image"
echo "[4] Install TWRP recovery"
echo ""
echo "[5] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[6] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus7/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus7/ubuntu/screencast.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7/android/factoryimage.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus7/android/twrp.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus7/android/bootloader.sh
elif [ "$option" = "6" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
