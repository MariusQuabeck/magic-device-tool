#!/bin/bash
chmod +x . ./devices/nexus10/ubuntu/*.sh
chmod +x . ./devices/nexus10/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 10 - manta"
echo ""
echo ""
sleep 1
#echo "Ubuntu: "
#echo ""
#echo "[1] Install Ubuntu"
#echo "[2] Install OpenStore"
#echo ""
#echo ""
echo "Android: "
echo ""
echo "[1] Install Cyanogenmod 13"
echo "[2] Install Phoenix OS"
echo "[3] Install Factory Image"
echo "[4] Install TWRP recovery"
echo "[5] Back Up your Android device"
echo ""
echo "[6] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "9" ]; then
. ./devices/nexus10/ubuntu/ubuntu.sh
elif [ "$option" = "8" ]; then
. ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "1" ]; then
. ./devices/nexus10/android/cyanogenmod.sh
elif [ "$option" = "2" ]; then
. ./devices/nexus10/android/phoenixos.sh
elif [ "$option" = "3" ]; then
. ./devices/nexus10/android/factoryimage.sh
elif [ "$option" = "4" ]; then
  . ./devices/nexus10/android/twrp.sh
elif [ "$option" = "5" ]; then
  . ./devices/generic/android/backup.sh
elif [ "$option" = "6" ]; then
  . ./devices/nexus10/android/bootloader.sh
elif [ "$option" = "7" ]; then
  return
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  return
fi
