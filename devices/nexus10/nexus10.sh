#!/bin/bash
chmod +x . ./devices/nexus10/ubuntu/*.sh
chmod +x . ./devices/nexus10/android/*.sh
clear
echo ""
echo "Nexus 10 - manta"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo ""
echo "Android: "
echo ""
echo "[2] Install Phoenix OS"
echo "[3] Install Factory Image"
echo "[4] Install TWRP recovery"
echo ""
echo "[5] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[6] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus10/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. ./devices/nexus10/android/phoenixos.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus10/android/factoryimage.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus10/android/twrp.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus10/android/bootloader.sh
elif [ "$option" = "6" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
