clear
echo ""
echo "Nexus 7 2013 (LTE) - deb"
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
  . .$SNAP/devices/nexus7deb/android/cyanogenmod.sh
elif [ "$option" = "2" ]; then
  . .$SNAP/devices/nexus7deb/android/cyanogenmodwogapps.sh
elif [ "$option" = "3" ]; then
  . .$SNAP/devices/nexus7deb/android/cyanogenmodbeta.sh
elif [ "$option" = "4" ]; then
. .$SNAP/devices/nexus7deb/android/cyanogenmodwogappsbeta.sh
elif [ "$option" = "5" ]; then
  . .$SNAP/devices/nexus7deb/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
