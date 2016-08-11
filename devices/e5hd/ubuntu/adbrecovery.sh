  clear
  echo ""
  echo "Flashing ADB recovery"
  echo ""
  sleep 1
  echo "Please boot your E5 HD into bootloader/fastboot mode by pressing Power & Volume Up (+)"
  echo "and select fastboot mode"
  echo ""
  sleep 1
  echo -n "Is your E5 HD in bootloader/fastboot mode now? [Y] "; read bootloadermode
  if [ "$bootloadermode"==Y -o "$bootloadermode"==y -o "$bootloadermode"=="" ]; then
    clear
    echo ""
    echo "Detecting device"
    echo ""
    sleep 1
    fastboot devices >~/.AttachedDevices
  fi
    if grep 'device$\|fastboot$' ~/.AttachedDevices
    then
      echo "Device detected !"
      sleep 1
      clear
      echo ""
      wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/recoverys/recovery-vegetahd.img
      sleep 1
      fastboot flash recovery recovery-vegetahd.img
      echo ""
      echo "Done"
      sleep 1
      echo ""
      echo "Cleaning up.."
      rm -f ~/.AttachedDevices
      #rm recovery-vegetahd.img
      echo ""
      sleep 1
          echo "Back to menu"
          sleep 3
          . ./launcher.sh
    else
      echo "Device not found"
      sleep 1
      rm -f ~/.AttachedDevices
          echo "Back to menu"
          sleep 3
          . ./launcher.sh
        fi
