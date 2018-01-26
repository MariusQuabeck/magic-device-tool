clear
echo ""
echo "Nexus 7 2013 (LTE) - deb"
echo ""
echo ""
sleep 1
echo "Cyanogenmod:"
echo ""
echo "[1]  Install Lineage OS 14.1"
echo "[2]  Install Lineage OS 14.1 without GAPPS"
echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/nexus7deb/android/lineageos.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus7deb/android/lineageoswogapps.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7deb/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
fi
