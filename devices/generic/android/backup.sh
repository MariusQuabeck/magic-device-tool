clear
echo ""
echo "Back Up/Restore your Android device"
echo ""
echo "[1] Back Up"
echo "[2] Restore"
echo "[3] Quit"
echo ""
sleep 1
echo -n "Enter option: "; read broption
if [ "$broption" = "1" ]; then
  clear
  echo ""
  echo "Back up your Android device"
  echo ""
  echo "Before connecting your Android device to your computer, make sure you enable USB Debugging"
  sleep 1
  echo ""
  echo -n "Is your device in USB Debugging mode now? [Y] "; read usbdebuggingmode
  if [ "$usbdebuggingmode"==Y -o "$usbdebuggingmode"==y -o "$usbdebuggingmode"=="" ]; then
	clear
	echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  adb devices > /tmp/AttachedDevices
  fi
  if grep 'device$\|device$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
  echo ""
  echo "Back up process starts..."
  echo ""
  echo ""
  echo "A backup notification will appear on your device"
  echo ""
  echo ""
  echo "Tap Back up my data to confirm. It's recommended that you add a password to your backup file. The operation may take a long time depending on the size of your data to be backed up."
  echo ""
  adb backup -all -f backup.ab
  echo ""
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
    . $SNAP/launcher.sh
  fi
elif [ "$broption" = "2" ]; then
	echo ""
	echo "Restore your Android device using the backup file that you have created"
	echo ""
  echo "Before connecting your Android device to your computer, make sure you enable USB Debugging"
  sleep 1
  echo ""
  echo -n "Is your device in USB Debugging mode now? [Y] "; read usbdebuggingmode
  if [ "$usbdebuggingmode"==Y -o "$usbdebuggingmode"==y -o "$usbdebuggingmode"=="" ]; then
	clear
	echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  adb devices >/tmp/AttachedDevices
  fi
  if grep 'device$\|device$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
  echo ""
  adb restore backup.ab
  echo ""
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
    . $SNAP/launcher.sh
  fi
elif [ "$broption" = "3" ]; then
      	echo "Quit"
      	echo "Exiting script. Bye Bye"
else
  echo "Device not found"
  sleep 1
  echo ""
  echo "Back to menu"
  sleep 1
  . $SNAP/launcher.sh
fi
