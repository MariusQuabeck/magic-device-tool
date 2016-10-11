clear
echo ""
echo "Installing Cyanogenmod 13"
echo ""
sleep 1
echo "Please boot your MX4 into bootloader/fastboot mode by pressing Power & Volume Down (-)"
echo ""
sleep 1
echo -n "Is your MX4 in bootloader/fastboot mode now? [Y] "; read bootloadermode
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
    echo "Installing TWRP recovery"
    echo ""
    sleep 1
    fastboot format cache
    fastboot format userdata
    fastboot format system
    fastboot erase recovery
    fastboot reboot-bootloader
    sleep 6
    clear
    echo ""
    echo "Downloading TWRP recovery"
    echo ""
    wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/recoverys/twrp-arale.img
    sleep 1
    fastboot flash recovery twrp-arale.img
    sleep 1
    echo ""
    echo "Downloading Cyanogenmod 13.."
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 https://emmaus.pro/MX4_custom_roms/Cyanogenmod%2013/cm-13.0-20160722-UNOFFICIAL-mx4.zip
    echo ""
    echo "Downloading Open Gapps.."
    echo ""
    sleep 1
    wget -c --quiet --show-progress --tries=10 http://people.ubuntu.com/~misterq/magic-device-tool/gapps/open_gapps-arm-6.0-nano-20160811.zip
    sleep 2
    clear
    echo ""
    echo "Please boot your MX 4 into recovery mode by pressing Power & Volume Up (+)"
    echo ""
    sleep 1
    echo -n "Is your MX 4 in recovery mode now? [Y] "; read recoverymode

    if [ "$recoverymode"==Y -o "$recoverymode"==y -o "$recoverymode"=="" ]; then
      echo ""
      echo "Detecting device"
      echo ""
      sleep 1
      adb devices >~/.AttachedDevices
    fi
    if grep 'device$\|recovery$' ~/.AttachedDevices
      then
        echo "Device detected !"
        sleep 1
        clear
        echo ""
        echo "Pushing zip's to device"
        sleep 1
        echo ""
        echo "Please wait this can take a while"
        echo ""
        echo "You may see a prompt asking you for read/write permissions"
        echo "Ignore that prompt, the tool will take care of the installation"
        echo ""
        echo "  → CM 13 zip "
        adb push -p cm-13.0-20160722-UNOFFICIAL-mx4.zip /sdcard/
        echo ""
        echo "  → gapps zip"
        adb push -p open_gapps-arm-6.0-nano-20160811.zip /sdcard/
        echo ""
        sleep 1
        echo ""
        echo "Installing Cyanogenmod.."
        echo ""
        adb shell twrp install /sdcard/cm-13.0-20160722-UNOFFICIAL-mx4.zip
        sleep 1
        echo ""
        echo "Installing GApps.."
        echo ""
        sleep 3
        adb shell twrp install /sdcard/open_gapps-arm-6.0-nano-20160811.zip
        echo ""
        echo "Wipe cache.."
        echo ""
        adb shell twrp wipe cache
        adb shell twrp wipe dalvik
        echo ""
        adb reboot
        echo "The device is now rebooting. Give it time to flash the new ROM. It will boot on its own."
        echo ""
        sleep 5
        echo ""
        echo "Cleaning up.."
        rm -f ~/.AttachedDevices
        echo ""
        sleep 1
        echo "Exiting script. Bye Bye"
        sleep 1
      else
        echo "Device not found"
        rm -f ~/.AttachedDevices
        sleep 1
        echo ""
        echo "Back to menu"
        sleep 1
        . ./launcher.sh
    fi
    else
    echo "Device not found"
    rm -f ~/.AttachedDevices
    sleep 1
    echo ""
    echo "Back to menu"
    sleep 1
    . ./launcher.sh
  fi
