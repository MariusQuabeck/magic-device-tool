clear
echo ""
echo "Nexus 5 - hammerhead"
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
  . ./devices/nexus5/android/maruos.sh
elif [ "$option" = "2" ]; then
  . ./devices/nexus5/android/maruoswogapps.sh
elif [ "$option" = "3" ]; then
  . ./devices/nexus5/nexus5.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  return
fi
