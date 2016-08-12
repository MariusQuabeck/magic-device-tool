#!/bin/bash
chmod +x . ./devices/nexus5/ubuntu/*.sh
chmod +x . ./devices/nexus5/android/*.sh
clear
echo ""
echo "Nexus 5 - hammerhead"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo ""
echo ""
echo "Android:"
echo ""
echo "[3] Install Cyanogenmod 13"
echo "[4] Install Factory Image"
echo "[5] Install TWRP recovery"
echo ""
echo "[6] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus5/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. ./devices/nexus5/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus5/android/cyanogenmod.sh
elif [ "$option" = "4" ]; then
. ./devices/nexus5/android/factoryimage.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus5/android/twrp.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus5/android/bootloader.sh
elif [ "$option" = "7" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
