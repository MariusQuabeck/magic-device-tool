#!/bin/bash
chmod +x . ./devices/nexus5/ubuntu/*.sh
chmod +x . ./devices/nexus5/android/*.sh
chmod +x . ./devices/generic/ubuntu/*.sh
chmod +x . ./devices/generic/android/*.sh
clear
echo ""
echo "Nexus 5 - hammerhead"
echo ""
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1]  Install Ubuntu"
echo "[2]  Install OpenStore"
echo ""
echo ""
echo "Android:"
echo ""
echo "[3]  Install Lineage OS"
echo "[4]  Install Maru OS"
echo "[5]  Install Sailfish OS"
echo "[6]  Install Factory Image"
echo "[7]  Install TWRP recovery"
echo "[8]  Back Up your Android device"
echo ""
echo "[9]  Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[10] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
. .$SNAP/devices/nexus5/ubuntu/ubuntu.sh
elif [ "$option" = "2" ]; then
. .$SNAP/devices/generic/ubuntu/openstore.sh
elif [ "$option" = "3" ]; then
. .$SNAP/devices/nexus5/android/los.sh
elif [ "$option" = "4" ]; then
. .$SNAP/devices/nexus5/android/maru.sh
elif [ "$option" = "5" ]; then
. .$SNAP/devices/nexus5/android/sailfishos.sh
elif [ "$option" = "6" ]; then
. .$SNAP/devices/nexus5/android/factoryimage.sh
elif [ "$option" = "7" ]; then
  . .$SNAP/devices/nexus5/android/twrp.sh
elif [ "$option" = "8" ]; then
  . .$SNAP/devices/generic/android/backup.sh
elif [ "$option" = "9" ]; then
  . .$SNAP/devices/nexus5/android/bootloader.sh
elif [ "$option" = "10" ]; then
  . .$SNAP/launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
