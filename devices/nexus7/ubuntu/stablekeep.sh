clear
echo ""
echo "Flashing stable channel"
echo ""
sleep 1
echo "Please boot your Nexus 7 into recovery mode by pressing Power & Volume Down (-)"
echo "and choose recovery"
echo ""
sleep 1
echo -n "Is your Nexus 7 in recovery mode now? [Y] "; read recoverymode

if [ "$recoverymode"==Y -o "$recoverymode"==y -o "$recoverymode"=="" ]; then
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  adb devices > /tmp/AttachedDevices
fi
if grep 'device$\|recovery$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    echo "Flashing stable channel"
    sleep 1
    echo ""
    ubuntu-device-flash touch --channel ubuntu-touch/stable/ubuntu --device flo
    echo ""
    echo "Move to your device to finish the setup."
    sleep 1
    echo ""
    echo "Cleaning up.."
    rm -f /tmp/AttachedDevices
    echo ""
    sleep 1
    echo "Exiting script. Bye Bye"
    sleep 1
  else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . .$SNAP/launcher.sh
fi
