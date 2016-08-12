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
echo "[2] Install Cyanogenmod 13"
echo "[3] Install Phoenix OS"
echo "[4] Install Factory Image"
echo "[5] Install TWRP recovery"
echo ""
echo "[6] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus10/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. ./devices/nexus10/android/cyanogenmod.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus10/android/phoenixos.sh
elif [ "$option" = "4" ]; then
. ./devices/nexus10/android/factoryimage.sh
elif [ "$option" = "5" ]; then
  . ./devices/nexus10/android/twrp.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus10/android/bootloader.sh
elif [ "$option" = "7" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
