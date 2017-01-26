adb start-server
clear
echo ""
echo "Please enable developer mode on the device"
  echo "this is located in system-settings → About → Developer Mode"
  echo ""
  echo "Please confirm the pairing dialog on the device"
  echo ""
  sleep 1
  echo -n "Did you enable developer mode ? [Y] "; read developermode
  if [ "$developermode"==Y -o "$developermode"==y -o "$developermode"=="" ]; then
    clear
    echo ""
    echo "Detecting device"
    echo ""
    sleep 1
    adb devices > /tmp/AttachedDevices
    echo ""
    sleep 1
  fi
    if grep 'device$\|device$' /tmp/AttachedDevices
    then
      echo ""
      echo "Device detected !"

exit | phablet-shell
clear
exit | phablet-shell
clear
echo ""
echo "Installing OpenStore.."
echo ""
adb shell "
cd Downloads && wget -c --quiet --show-progress --tries=10 https://open.uappexplorer.com/api/download/openstore.openstore-team/openstore.openstore-team_latest_armhf.click && pkcon install-local --allow-untrusted openstore.openstore-team_latest_armhf.click && rm openstore.openstore-team_latest_armhf.click && exit"
sleep 1
echo ""
echo "done"
echo ""
sleep 3
echo "Back to menu"
rm -f /tmp/AttachedDevices
sleep 2
. .$SNAP/launcher.sh




else
      echo "Device not found"
      sleep 1
      rm -f /tmp/AttachedDevices
      echo "Back to menu"
    sleep 1
    . .$SNAP/launcher.sh

    fi
