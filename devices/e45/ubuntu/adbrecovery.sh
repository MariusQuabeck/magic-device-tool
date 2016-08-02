  clear
  echo ""
  echo "Flashing ADB recovery"
  echo ""
  sleep 1
  echo "Please boot your E4.5 into bootloader/fastboot mode by pressing Power & Volume Up (+)"
  echo "and select fastboot mode"
  echo ""
  sleep 1
  echo -n "Is your E4.5 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
      wget http://people.canonical.com/~jhm/barajas/recovery-krillin.img
      sleep 1
      fastboot flash recovery recovery-krillin.img
      echo ""
      echo "Done"
      sleep 1
      echo ""
      echo "Cleaning up.."
      rm -f ~/.AttachedDevices
      rm recovery-krillin.img
      echo ""
      sleep 1
          echo "Back to menu"
          sleep 3
          . ./launcher.sh
    else
      echo "Device not found"
      sleep 1
          echo "Back to menu"
          sleep 3
          . ./launcher.sh
        fi
