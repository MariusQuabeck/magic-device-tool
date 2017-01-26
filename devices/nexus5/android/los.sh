clear
echo ""
echo "Nexus 5 - hammerhead"
echo ""
echo ""
sleep 1
echo "LineageOS:"
echo ""
echo "recommended:"
echo "[1]  Install LineageOS 14.1"
echo "[2]  Install LineageOS 14.1 without GAPPS"
#echo ""
#echo "beta/not stable:"
#echo "[3]  Install Cyanogenmod 14.1"
#echo "[4]  Install Cyanogenmod 14.1 without GAPPS"
echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . .$SNAP/devices/nexus5/android/lineageos.sh
elif [ "$option" = "2" ]; then
  . .$SNAP/devices/nexus5/android/lineageoswogapps.sh
#elif [ "$option" = "3" ]; then
#  . .$SNAP/devices/nexus5/android/cyanogenmodcaf.sh
#elif [ "$option" = "4" ]; then
#. .$SNAP/devices/nexus5/android/cyanogenmodwogappscaf.sh
elif [ "$option" = "3" ]; then
  . .$SNAP/devices/nexus5/nexus5.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
