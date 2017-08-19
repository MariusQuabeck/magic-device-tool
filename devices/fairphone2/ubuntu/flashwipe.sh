clear
echo ""
echo ""
echo "Choose a channel to flash (Will remove existing apps/data)"
echo ""
sleep 1
#echo "[1] stable"
#echo ""
#echo "[2] devel_rc-proposed"
#echo ""
echo "[1] legacy"
echo ""
echo "[2] Back to menu "
echo ""
echo -n "Enter option: "; read ubuntuwipechannel
#if [ "$ubuntuwipechannel" = "1" ]; then
#. ./devices/fairphone2/ubuntu/stablewipe.sh
if [ "$ubuntuwipechannel" = "1" ]; then
. ./devices/fairphone2/ubuntu/legacywipe.sh
elif [ "$ubuntuwipechannel" = "2" ]; then
  . ./launcher.sh
else
  echo ""
  echo "You did not enter a number between 1 and 2."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  exit
fi
