#!/bin/bash
chmod +x . ./devices/m10fhd/ubuntu/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
clear
echo ""
echo "BQ Aquaris M10 FHD - frieza"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo ""
echo "[3]  Back Up your UBports device"
echo ""
echo "[4] Screencast"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/m10fhd/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/m10fhd/ubuntu/screencast.sh
;;
0)
  . ./launcher.sh
;;
*)
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
;;
esac

