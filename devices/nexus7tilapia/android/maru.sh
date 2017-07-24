clear
echo ""
echo "Nexus 7 2013 WiFi - flo"
echo ""
echo ""
sleep 1
echo "Maru OS:"
echo ""
echo "[1]  Install Maru OS"
echo "[2]  Install Maru OS without Gapps"
echo ""
echo ""
echo "[3] Back to menu "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  . ./devices/nexus7/android/maruos.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus7/android/maruoswogapps.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus7/nexus7.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
