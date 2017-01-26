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
. .$SNAP/devices/m10fhd/ubuntu/stablekeep.sh
elif [ "$ubuntukeepchannel" = "2" ]; then
  . .$SNAP/devices/m10fhd/ubuntu/rc-proposedkeep.sh
elif [ "$ubuntukeepchannel" = "3" ]; then
  . .$SNAP/devices/m10fhd/ubuntu/stagingkeep.sh
elif [ "$ubuntukeepchannel" = "4" ]; then
  . .$SNAP/launcher.sh
else
  echo ""
  echo "You did not enter a number between 1 and 3."
  echo "Well... I'll be here during the whole next test. -GLaDOS"
  exit
fi
