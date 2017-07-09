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
echo "[4] Install LineageOS 13"
echo "[5] Install LineageOS 13 without Gapps"
echo "[6] Install Phoenix OS"
echo "[7] Install Factory Image"
echo "[8] Install TWRP recovery"
echo "[9] Back Up your Android device"
echo ""
echo "[10] Lock/Unlock bootloader (Will wipe existing apps/data)"
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
  . ./devices/nexus10/android/lineageos.sh
;;
5)
  . ./devices/nexus10/android/lineageoswogapps.sh
;;
6)
  . ./devices/nexus10/android/phoenixos.sh
;;
7)
  . ./devices/nexus10/android/factoryimage.sh
;;
8)
  . ./devices/nexus10/android/twrp.sh
;;
9)
  . ./devices/generic/android/backup.sh
;;
10)
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

