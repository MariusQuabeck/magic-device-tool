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
echo "[3]  Back Up your UBports device"
echo ""
echo ""
echo "Android: "
echo ""
echo "[4]  Install Cyanogenmod"
echo "[5]  Install Sailfish OS"
echo "[6]  Install Factory Image"
echo "[7]  Install TWRP recovery"
echo "[8]  Back Up your Android device"
echo ""
echo "[9]  Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[0]  Back to menu "
echo ""
echo -n "Enter option: "; read option
case "$option" in
1)
  . ./devices/nexus7deb/ubuntu/ubuntu.sh
;;
2)
  . ./devices/generic/ubuntu/openstore.sh
;;
3)
  . ./devices/generic/ubuntu/ubports-backup.sh
;;
4)
  . ./devices/nexus7deb/android/cm.sh
;;
5)
  . ./devices/nexus7deb/android/sailfishos.sh
;;
6)
  . ./devices/nexus7deb/android/factoryimage.sh
;;
7)
  . ./devices/nexus7deb/android/twrp.sh
;;
8)
  . ./devices/generic/android/backup.sh
;;
9)
  . ./devices/nexus7deb/android/bootloader.sh
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

