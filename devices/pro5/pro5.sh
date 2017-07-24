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
echo ""
echo "[1] Back Up your UBports device"
echo ""
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
0)
  . ./launcher.sh
;;
*)
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
;;
esac

