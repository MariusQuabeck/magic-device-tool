#!/bin/bash
chmod +x . ./devices/mx4/ubuntu/*.sh
chmod +x . ./devices/mx4/android/*.sh
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
echo ""
echo ""
echo "[5] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/mx4/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/mx4/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/mx4/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  . ./devices/mx4/android/cyanogenmod.sh
elif [ "$option" = "5" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
