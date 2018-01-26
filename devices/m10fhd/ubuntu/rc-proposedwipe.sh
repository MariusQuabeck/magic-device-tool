clear
adb start-server
clear

  echo ""
  echo "Flashing rc-proposed channel"
  echo ""
  sleep 1
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
      sleep 1
      clear
      echo ""
      echo "Flashing rc-proposed channel"
      echo ""
      adb reboot-bootloader
      echo "Please wait"
      sleep 6
      wget -c --quiet --show-progress --tries=10 -P $HOME/.cache/magic-device-tool/ http://mdt-files.com/downloads/magic-device-tool/recoverys/recovery-frieza.img
      sleep 1
      clear
      echo ""
      ubuntu-device-flash touch --bootstrap --device frieza --channel ubuntu-touch/rc-proposed/bq-aquaris-pd.en --recovery-image $HOME/.cache/magic-device-tool/recovery-frieza.img
      sleep 1
      echo ""
      echo "Move to your device to finish the setup."
      sleep 1
      echo ""
      echo "Cleaning up.."
      rm -f /tmp/AttachedDevices
      #rm recovery-frieza.img
      echo ""
      sleep 1
      echo "Exiting magic-device-tool. Bye Bye"
      sleep 1
      exit
    else
      echo "Device not found"
      rm -f /tmp/AttachedDevices
      echo ""
      sleep 1
      echo "Back to menu"
    sleep 1
    . ./launcher.sh
    fi
