clear
echo ""
echo "Choose a channel to flash (Will remove existing apps/data)"
echo ""
sleep 1
echo "[1] legacy"
#echo "[2] rc-proposed"
#echo "[3] devel_rc-proposed"
echo ""
echo "[2] Back to menu "
echo ""
echo -n "Enter option: "; read ubuntuwipechannel
if [ "$ubuntuwipechannel" = "1" ]; then
. ./devices/oneplusone/ubuntu/legacywipe.sh
#elif [ "$ubuntuwipechannel" = "2" ]; then
#. ./devices/oneplusone/ubuntu/rc-proposedwipe.sh
#elif [ "$ubuntuwipechannel" = "3" ]; then
#. ./devices/oneplusone/ubuntu/devel_rc-proposedwipe.sh
elif [ "$ubuntuwipechannel" = "2" ]; then
  . ./launcher.sh
else
  echo ""
  echo "You did not enter a number between 1 and 2."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  exit
fi
