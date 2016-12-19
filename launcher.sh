#!/bin/bash
clear
echo "Choose your device"
echo ""
echo "  [1]  BQ Aquaris E4.5 - krillin"
echo "  [2]  BQ Aquaris E5 HD - vegetahd"
echo "  [3]  BQ Aquaris M10 HD - cooler"
echo "  [4]  BQ Aquaris M10 FHD - frieza"
echo "  [5]  Meizu MX 4 - arale"
#echo "  [6]  Meizu Pro 5 - turbo" --removed until Marius can get his hands on this device
echo "  [6]  LG Nexus 4 - mako"
echo "  [7]  LG Nexus 5 - hammerhead"
echo "  [8]  Asus Nexus 7 2013 (WiFi) - flo"
echo "  [9]  Samsung Nexus 10 - manta"
echo "  [10] OnePlus One - bacon"
#echo "  [15] Fairphone 2 - FP2 !!May not work!!" --removed until the ubports build works again
echo "  ========================================="
echo "  [11] Join Telegram Group Chat"
echo "  [12] Report a bug"
echo ""
echo "  [13] Quit"
echo ""
sleep 1
echo -n "Enter number: "; read device
if [ "$device" = "1" ]; then
  . $SNAP/devices/e45/e45.sh
elif [ "$device" = "2" ]; then
  . $SNAP/devices/e5hd/e5hd.sh
elif [ "$device" = "3" ]; then
  . $SNAP/devices/m10hd/m10hd.sh
elif [ "$device" = "4" ]; then
  . $SNAP/devices/m10fhd/m10fhd.sh
elif [ "$device" = "5" ]; then
  . $SNAP/devices/mx4/mx4.sh
#elif [ "$device" = "6" ]; then
#  . ./devices/pro5/pro5.sh
elif [ "$device" = "6" ]; then
  . $SNAP/devices/nexus4/nexus4.sh
elif [ "$device" = "7" ]; then
  . $SNAP/devices/nexus5/nexus5.sh
elif [ "$device" = "8" ]; then
  . $SNAP/devices/nexus7/nexus7.sh
elif [ "$device" = "9" ]; then
  . $SNAP/devices/nexus10/nexus10.sh
elif [ "$device" = "10" ]; then
  . $SNAP/devices/oneplusone/oneplusone.sh
#elif [ "$device" = "15" ]; then
#  . ./devices/fairphone2/fairphone2.sh
elif [ "$device" = "11" ]; then
  . $SNAP/devices/generic/telegram.sh
elif [ "$device" = "12" ]; then
  . $SNAP/devices/generic/reportabug.sh
elif [ "$device" = "13" ]; then
  exit
else
  echo ""
  echo "You did not enter a number between 1 and 16."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
fi
