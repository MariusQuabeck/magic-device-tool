#!/bin/bash
chmod +x . ./devices/nexus4/ubuntu/*.sh
chmod +x . ./devices/nexus4/android/*.sh
clear
echo ""
echo "Nexus 4 - mako"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo "[3] Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[4] Install Cyanogenmod 13"
echo "[5] Install Factory Image"
echo "[6] Install TWRP recovery"
echo ""
echo "[7] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[8] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus4/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus4/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus4/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus4/android/cyanogenmod.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus4/android/factoryimage.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus4/android/twrp.sh
elif [ "$option" = "7" ]; then
  . ./devices/nexus4/android/bootloader.sh
elif [ "$option" = "8" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
