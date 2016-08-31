#!/bin/bash
chmod +x . ./devices/oneplusone/ubuntu/*.sh
chmod +x . ./devices/oneplusone/android/*.sh
clear
echo ""
echo "OnePlus One - bacon"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo ""
echo ""
echo "Android: "
echo ""
echo "[3] Back Up your Android device"
echo
echo ""
echo "[4] Install Cyanogenmod 13"
echo ""
echo "[5] Install TWRP recovery"
echo "[6] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/oneplusone/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/oneplusone/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/oneplusone/android/backup.sh
elif [ "$option" = "4" ]; then
  . ./devices/oneplusone/android/cyanogenmod.sh
elif [ "$option" = "5" ]; then
  . ./devices/oneplusone/android/twrp.sh
elif [ "$option" = "6" ]; then
  . ./devices/oneplusone/android/bootloader.sh
elif [ "$option" = "7" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
