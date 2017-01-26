#!/bin/bash
chmod +x . ./devices/oneplusone/ubuntu/*.sh
chmod +x . ./devices/oneplusone/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "OnePlus One - bacon"
echo ""
echo ""
echo "Please start the tool with 'sudo ./launcher.sh' otherwise it wont work !"
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
echo "[3] Install LineageOS 14.1"
echo "[4] Install LineageOS 14.1 without Gapps"
echo ""
echo "[5] Install Sailfish OS"
echo ""
echo "[6] Install TWRP recovery"
echo "[7] Back Up your Android device"
echo "[8] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo ""
echo "[9] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/oneplusone/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/oneplusone/android/lineageos.sh
elif [ "$option" = "4" ]; then
  . ./devices/oneplusone/android/lineageoswogapps.sh
elif [ "$option" = "5" ]; then
  . ./devices/oneplusone/android/sailfishos.sh
elif [ "$option" = "6" ]; then
  . ./devices/oneplusone/android/twrp.sh
elif [ "$option" = "7" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "8" ]; then
  . ./devices/oneplusone/android/bootloader.sh
elif [ "$option" = "9" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
