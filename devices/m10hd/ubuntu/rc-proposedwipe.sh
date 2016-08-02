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
    adb devices >~/.AttachedDevices
    echo ""
    sleep 1
  fi
    if grep 'device$\|device$' ~/.AttachedDevices
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
      wget http://people.canonical.com/~abeato/avila/cooler/recovery-cooler.img
      sleep 1
      clear
      echo ""
      ubuntu-device-flash touch --bootstrap --device cooler --channel ubuntu-touch/rc-proposed/bq-aquaris-pd.en --recovery-image recovery-cooler.img
      sleep 1
      echo ""
      echo "Move to your device to finish the setup."
      sleep 1
      echo ""
      echo "Cleaning up.."
      rm -f ~/.AttachedDevices
      rm recovery-cooler.img
      echo ""
      sleep 1
      echo "Exiting script. Bye Bye"
      sleep 1
      exit
    else
      echo "Device not found"
      echo ""
      sleep 1
      echo "Back to menu"
    sleep 1
    . ./launcher.sh
    fi
