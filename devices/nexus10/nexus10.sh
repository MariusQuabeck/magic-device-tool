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
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo "[2] Install OpenStore"
echo ""
echo "[3]  Back Up your UBports device"
echo ""
echo ""
echo "Android: "
echo ""
echo "[4] Install Lineage OS 13"
echo "[5] Install Phoenix OS"
echo "[6] Install Factory Image"
echo "[7] Install TWRP recovery"
echo "[8] Back Up your Android device"
echo ""
echo "[9] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[0] Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus10/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/nexus10/android/los.sh
;;
5)
  . ./devices/nexus10/android/phoenixos.sh
;;
6)
  . ./devices/nexus10/android/factoryimage.sh
;;
7)
  . ./devices/nexus10/android/twrp.sh
;;
8)
  . ./devices/generic/android/backup.sh
;;
9)
  . ./devices/nexus10/android/bootloader.sh
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

