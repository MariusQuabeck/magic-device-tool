#!/bin/bash
chmod +x . ./devices/nexus5/ubuntu/*.sh
chmod +x . ./devices/nexus5/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 5 - hammerhead"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1]  Install Ubuntu"
echo "[2]  Install OpenStore"
echo ""
echo ""
echo "Android:"
echo ""
echo "[3]  Install Cyanogenmod 13"
echo "[4]  Install Cyanogenmod 13 without Gapps"
echo "[5]  Install Maru OS"
echo "[6]  Install Maru OS without Gapps"
echo "[7]  Install Sailfish OS"
echo "[8]  Install AOSP 7.1 Nougat (Rom By @Santhosh M)"
echo "[9]  Install AOSP 7.1 Nougat without Gapps (Rom By @Santhosh M)"
echo "[10]  Install Factory Image"
echo "[11]  Install TWRP recovery"
echo "[12] Back Up your Android device"
echo ""
echo "[13] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[14] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/nexus5/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus5/android/cyanogenmod.sh
elif [ "$option" = "4" ]; then
. ./devices/nexus5/android/cyanogenmodwogapps.sh
elif [ "$option" = "5" ]; then
. ./devices/nexus5/android/maruos.sh
elif [ "$option" = "6" ]; then
. ./devices/nexus5/android/maruoswogapps.sh
elif [ "$option" = "7" ]; then
. ./devices/nexus5/android/sailfishos.sh
elif [ "$option" = "8" ]; then
. ./devices/nexus5/android/aospnougat.sh
elif [ "$option" = "9" ]; then
. ./devices/nexus5/android/aospnougatwogapps.sh
elif [ "$option" = "10" ]; then
. ./devices/nexus5/android/factoryimage.sh
elif [ "$option" = "11" ]; then
  . ./devices/nexus5/android/twrp.sh
elif [ "$option" = "12" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "13" ]; then
  . ./devices/nexus5/android/bootloader.sh
elif [ "$option" = "14" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
