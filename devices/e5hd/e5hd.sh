#!/bin/bash
chmod +x . ./devices/e5hd/ubuntu/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
clear
echo ""
echo "BQ Aquaris E5 HD - vegetahd"
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
echo "[4] Back to menu"
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. ./devices/e5hd/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
  . ./devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
  . ./devices/e5hd/ubuntu/screencast.sh
elif [ "$option" = "4" ]; then
  return
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
