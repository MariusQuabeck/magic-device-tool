#!/bin/bash
chmod +x . ./devices/pro5/ubuntu/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
clear
echo ""
echo "Meizu Pro 5 - turbo"
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
echo "[4] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. .$SNAP/devices/pro5/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . .$SNAP/devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . .$SNAP/devices/pro5/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  . .$SNAP/launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
