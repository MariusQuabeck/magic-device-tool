clear
echo ""
echo "Please start the tool with 'sudo ./launcher.sh' otherwise it wont work !"
echo ""
echo "  "
echo "Install Ubuntu"
echo ""
sleep 1
echo "[1] Choose a channel to flash (Will remove existing apps/data)"
echo ""
echo "[2] Back to menu "
sleep 1
echo ""
echo -n "Enter option: "; read optionubuntu
if [ "$optionubuntu" = "1" ]; then
  . ./devices/fairphone2/ubuntu/flashwipe.sh
elif [ "$optionubuntu" = "2" ]; then
  . ./launcher.sh
else
  echo ""
  echo "Invalid Option"
  echo ""
  echo "Exiting script. Bye Bye"
  exit
fi
