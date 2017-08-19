clear
echo ""
echo "Nexus 10 - manta"
echo ""
echo ""
sleep 1
echo "LineageOS:"
echo ""
echo "recommended:"
echo "[1]  Install LineageOS 13"
echo "[2]  Install LineageOS 13 without GAPPS"
echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/nexus10/android/lineageos.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus10/android/lineageoswogapps.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus10/nexus10.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
fi
