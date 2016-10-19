clear
echo ""
echo "Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[1] Lock"
echo "[2] Unlock"
echo "[3] Quit"
echo ""
sleep 1
echo -n "Enter option: "; read ulbootloader
if [ "$ulbootloader" = "1" ]; then
  clear
  echo ""
  echo "Lock bootloader"
  echo ""
  echo "Please boot your Oneplus One into bootloader/fastboot mode by pressing Power & Volume Up (+)"
  sleep 1
  echo ""
  echo -n "Is your Oneplus One in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
      fastboot oem lock
      sleep 1
      echo ""
      echo "Bootloader locked"
      echo ""
      echo "Cleaning up.."
      rm -f /tmp/AttachedDevices
      echo ""
      echo "Exiting script. Bye Bye"
      sleep 1
      exit
    fi
elif [ "$ulbootloader" = "2" ]; then
    clear
    echo ""
    echo "Unlock bootloader"
    echo ""
    echo "Please boot your Oneplus One into bootloader/fastboot mode by pressing Power & Volume Up (+)"
    echo ""
    sleep 1
    echo -n "Is your Oneplus One in bootloader/fastboot mode now? [Y] "; read bootloadermode
    if [ "$bootloadermode"==Y -o "$bootloadermode==y" -o "$bootloadermode"=="" ]; then
      clear
      echo ""
      echo "Detecting device"
      echo ""
      sleep 1
      fastboot devices >/tmp/AttachedDevices
    fi
      if grep 'device$\|fastboot$' /tmp/AttachedDevices
      then
        echo "Device detected !"
        sleep 1
        clear
        echo ""
        echo "Follow the instructions on your device"
        echo ""
        sleep 1
        fastboot oem unlock
        sleep 1
        echo ""
        echo "Bootloader unlocked"
        echo ""
        echo "Cleaning up.."
        rm -f /tmp/AttachedDevices
        echo ""
        echo "Exiting script. Bye Bye"
        sleep 1
        exit
      fi
  elif [ "$ulbootloader" = "3" ]; then
      rm -f /tmp/AttachedDevices
      echo "Quit"
      echo "Exiting script. Bye Bye"
fi

else
  echo "Device not found."
      rm -f /tmp/AttachedDevices
  exit
