clear
echo ""
echo "Flashing rc-proposed channel"
echo ""
sleep 1
echo "Please boot your Fairphone 2 into fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your Fairphone 2 in bootloader/fastboot mode now? [Y] "; read bootloadermode
if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
  clear
  echo ""
  echo "Detecting device"
  echo ""
  sleep 1
  fastboot devices > /tmp/AttachedDevices
fi
  if grep 'device$\|fastboot$' /tmp/AttachedDevices
  then
    echo "Device detected !"
    sleep 1
    clear
    echo ""
    sleep 1
        echo "Flashing rc-proposed channel"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot format system
    fastboot reboot-bootloader
    sleep 6
    clear
    echo ""
    echo "Downloading boot.img"
    echo ""
    wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~marius.quabeck/magic-device-tool/fp2/bootfp2.img
    sleep 1
    echo ""
    echo "Downloading recovery.img"
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~marius.quabeck/magic-device-tool/fp2/recoveryfp2.img
    echo ""
    sleep 1
    fastboot flash recovery recoveryfp2.img
    fastboot flash boot bootfp2.img
    clear
    echo ""
    echo "Please boot your Fairphone 2 into recovery mode by pressing Power & Volume Up (+)"
    echo ""
    echo "Wait until you see the 'UBports Recovery' screen."
    echo "this can take up to ~30 seconds"
    sleep 1
    echo -n "Is your Fairphone 2 in recovery mode now? [Y] "; read recoverymode

    if [ "$recoverymode"==Y -o "$recoverymode"==y -o "$recoverymode"=="" ]; then
      echo ""
      echo "Detecting device"
      echo ""
      sleep 1
      adb devices >/tmp/AttachedDevices
    fi
    if grep 'device$\|recovery$' /tmp/AttachedDevices
      then
        echo "Device detected !"
        #sleep 12
        #echo "waiting for recovery"
        #echo "this can take up to ~30 seconds"
        adb shell "
	mount -a"
        sudo ubuntu-device-flash --server=http://system-image.ubports.com touch --channel=ubuntu-touch/rc-proposed --device=FP2
        sleep 5
        echo ""
        echo "Move to your device to finish the setup."
        echo ""
	sleep 1
        echo "You will see the Fairphone bootscreen for a few minutes now. Don't worry."
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
    else
    echo "Device not found"
    rm -f /tmp/AttachedDevices
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . .$SNAP/launcher.sh
  fi
