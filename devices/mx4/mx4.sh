#!/bin/bash
chmod +x . ./devices/mx4/ubuntu/*.sh
chmod +x . ./devices/mx4/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Meizu MX4 - arale"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Install OpenStore"
echo ""
echo "[3] Screencast"
echo ""
echo ""
echo "Android: "
echo ""
echo "[4] Install Cyanogenmod 13"
echo "[5] Install Cyanogenmod 13 without Gapps"
echo ""
echo "[6] Back Up your Android device"
echo ""
echo "[7] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. .$SNAP/devices/mx4/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . .$SNAP/devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . .$SNAP/devices/mx4/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  . .$SNAP/devices/mx4/android/cyanogenmod.sh
elif [ "$option" = "5" ]; then
  . .$SNAP/devices/mx4/android/cyanogenmodwogapps.sh
elif [ "$option" = "6" ]; then
  . .$SNAP/devices/generic/android/backup.sh
elif [ "$option" = "7" ]; then
  . .$SNAP/launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
