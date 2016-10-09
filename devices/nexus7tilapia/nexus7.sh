#!/bin/bash
chmod +x . ./devices/nexus7tilapia/android/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 7 2012 (3G) - tilapia"
echo ""
echo ""
sleep 1
echo "Android: "
echo ""
echo "[1] Install Cyanogenmod 12.1"
echo "[2] Install Cyanogenmod 12.1 without Gapps"
echo "[3] Install Factory Image"
echo "[4] Install TWRP recovery"
echo "[5] Back Up your Android device"
echo ""
echo "[6] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus7tilapia/android/cyanogenmod.sh
elif [ "$option" = "2" ]; then
. ./devices/nexus7tilapia/android/cyanogenmodwogapps.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus7tilapia/android/factoryimage.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus7tilapia/android/twrp.sh
elif [ "$option" = "5" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus7tilapia/android/bootloader.sh
elif [ "$option" = "7" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
