clear
echo ""
echo "Choose a channel to flash (Will remove existing apps/data)"
echo ""
sleep 1
echo "[1] stable"
echo "[2] rc-proposed"
echo "[3] devel_rc-proposed"
echo ""
echo "[4] Back to menu "
echo ""
echo -n "Enter option: "; read ubuntuwipechannel
if [ "$ubuntuwipechannel" = "1" ]; then
. ./devices/nexus5/ubuntu/stablewipe.sh
elif [ "$ubuntuwipechannel" = "2" ]; then
. ./devices/nexus5/ubuntu/rc-proposedwipe.sh
elif [ "$ubuntuwipechannel" = "3" ]; then
. ./devices/nexus5/ubuntu/devel_rc-proposedwipe.sh
elif [ "$ubuntuwipechannel" = "4" ]; then
  . ./launcher.sh
else
  echo ""
  echo "You did not enter a number between 1 and 2."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  exit
fi
