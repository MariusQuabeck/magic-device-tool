clear
echo ""
echo "Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
echo ""
sleep 1
echo "[1] stable"
echo "[2] rc-proposed"
echo ""
echo "[3] staging"
echo ""
echo "[4] Back to menu "
echo ""
echo -n "Enter option: "; read ubuntuwipechannel
if [ "$ubuntuwipechannel" = "1" ]; then
. ./devices/m10hd/ubuntu/stablewipe.sh
elif [ "$ubuntuwipechannel" = "2" ]; then
  . ./devices/m10hd/ubuntu/rc-proposedwipe.sh
elif [ "$ubuntuwipechannel" = "3" ]; then
  . ./devices/m10hd/ubuntu/stagingwipe.sh
elif [ "$ubuntuwipechannel" = "4" ]; then
  return
else
  echo ""
  echo "You did not enter a number between 1 and 3."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  return
fi
