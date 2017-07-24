clear
echo ""
echo "Nexus 7 2012 3G - tilapia"
echo ""
echo ""
sleep 1
echo "Cyanogenmod 10.2.1:"
echo ""
echo "[1]  Install Cyanogenmod 10.2.1"
echo "[2]  Install Cyanogenmod 10.2.1 without GAPPS"
echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/nexus7tilapia/android/cyanogenmod.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus7tilapia/android/cyanogenmodwogapps.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7tilapia/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
