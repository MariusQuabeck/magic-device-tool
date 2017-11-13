clear
echo ""
echo "Nexus 7 2013 WiFi - flo"
echo ""
echo ""
sleep 1
echo "LineageOS:"
echo ""
echo "recommended:"
echo "[1]  Install LineageOS 14.1"
echo "[2]  Install LineageOS 14.1 without GAPPS"
echo ""
#echo "beta/not stable:"
#echo "[3]  Install Cyanogenmod 14.1"
#echo "[4]  Install Cyanogenmod 14.1 without GAPPS"
#echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/nexus7/android/lineageos.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus7/android/lineageoswogapps.sh
#elif [ "$option" = "3" ]; then
#  . ./devices/nexus7/android/cyanogenmodbeta.sh
#elif [ "$option" = "4" ]; then
#. ./devices/nexus7/android/cyanogenmodwogappsbeta.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
fi
