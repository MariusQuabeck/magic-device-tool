clear
echo ""
echo "Choose a channel to flash "
echo "Your Apps/Data won't be touched, it will just reinstall Ubuntu / switch the channel."
echo ""
sleep 1
echo "[1] stable"
echo "[2] rc-proposed"
echo ""
echo "[3] staging"
echo ""
echo "[4] Back to menu "
echo ""
echo -n "Enter option: "; read ubuntukeepchannel
if [ "$ubuntukeepchannel" = "1" ]; then
. ./devices/m10hd/ubuntu/stablekeep.sh
elif [ "$ubuntukeepchannel" = "2" ]; then
  . ./devices/m10hd/ubuntu/rc-proposedkeep.sh
elif [ "$ubuntukeepchannel" = "3" ]; then
  . ./devices/m10hd/ubuntu/stagingkeep.sh
elif [ "$ubuntukeepchannel" = "4" ]; then
  return
else
  echo ""
  echo "You did not enter a number between 1 and 3."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  return
fi
