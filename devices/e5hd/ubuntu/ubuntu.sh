clear
echo "  "
echo "Install Ubuntu"
echo ""
sleep 1
echo "[1] Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
#echo "[2] Choose a channel to switch your device to (Will keep existing apps/data) "
echo ""
echo "[2] Back to menu "
sleep 1
echo ""
echo -n "Enter option: "; read optionubuntu
if [ "$optionubuntu" = "1" ]; then
  . ./devices/e5hd/ubuntu/flashwipe.sh
#elif [ "$optionubuntu" = "2" ]; then
#  . ./devices/e5hd/ubuntu/flashkeep.sh
elif [ "$optionubuntu" = "2" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting magic-device-tool. Bye Bye"
  exit
fi
