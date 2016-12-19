clear
echo ""
echo "Nexus 7 2013 WiFi - flo"
echo ""
echo ""
sleep 1
echo "Cyanogenmod:"
echo ""
echo "recommended:"
echo "[1]  Install Cyanogenmod 13"
echo "[2]  Install Cyanogenmod 13 without GAPPS"
echo ""
echo "beta/not stable:"
echo "[3]  Install Cyanogenmod 14.1"
echo "[4]  Install Cyanogenmod 14.1 without GAPPS"
echo ""
echo ""
echo "[5] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . $SNAP/devices/nexus7/android/cyanogenmod.sh
elif [ "$option" = "2" ]; then
  . $SNAP/devices/nexus7/android/cyanogenmodwogapps.sh
elif [ "$option" = "3" ]; then
  . $SNAP/devices/nexus7/android/cyanogenmodbeta.sh
elif [ "$option" = "4" ]; then
. $SNAP/devices/nexus7/android/cyanogenmodwogappsbeta.sh
elif [ "$option" = "5" ]; then
  . $SNAP/devices/nexus7/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
