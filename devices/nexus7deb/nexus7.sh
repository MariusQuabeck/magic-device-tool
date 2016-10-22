#!/bin/bash
chmod +x . ./devices/nexus7deb/ubuntu/*.sh
chmod +x . ./devices/nexus7deb/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 7 2013 (LTE) - deb"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1]  Install Ubuntu"
echo "[2]  Install OpenStore"
echo ""
echo ""
echo "Android: "
echo ""
echo "[3]  Install Cyanogenmod 13"
echo "[4]  Install Cyanogenmod 13 without Gapps"
echo "[5]  Install Sailfish OS"
echo "[6]  Install Factory Image"
echo "[7]  Install TWRP recovery"
echo "[8]  Back Up your Android device"
echo ""
echo "[9]  Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[10] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus7deb/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus7deb/android/cyanogenmod.sh
elif [ "$option" = "4" ]; then
. ./devices/nexus7deb/android/cyanogenmodwogapps.sh
elif [ "$option" = "5" ]; then
. ./devices/nexus7deb/android/sailfishos.sh
elif [ "$option" = "6" ]; then
. ./devices/nexus7deb/android/factoryimage.sh
elif [ "$option" = "7" ]; then
  . ./devices/nexus7deb/android/twrp.sh
elif [ "$option" = "8" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "9" ]; then
  . ./devices/nexus7deb/android/bootloader.sh
elif [ "$option" = "10" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
