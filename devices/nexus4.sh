#!/bin/bash
clear
echo ""
echo "Nexus 4 - mako"
echo ""
sleep 1
echo "Ubuntu: "
echo "[1] Install Ubuntu"
echo ""
echo "Android"
echo "[2] Install Factory Image"
echo "[3] Install TWRP recovery"
echo ""
echo "[4] Lock/Unlock bootloader (Will wipe existing apps/data)"
echo ""
echo "[5] Quit "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  clear
  echo "  "
  echo "Install Ubuntu"
  echo ""
  sleep 1
  echo "[1] Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
  echo "[2] Choose a channel to switch your device to (Will keep existing apps/data) "
  sleep 1
  echo ""
  echo -n "Enter option: "; read optionubuntu
  if [ "$optionubuntu" = "1" ]; then
    clear
    echo ""
    echo "Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
    echo ""
    sleep 1
    echo "[1] stable"
    echo "[2] rc-proposed"
    echo ""
    echo -n "Enter option: "; read ubuntuwipechannel
    if [ "$ubuntuwipechannel" = "1" ]; then
      clear
      echo ""
      echo "Flashing stable channel"
      echo ""
      sleep 1
      echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
      echo ""
      sleep 1
      echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
      if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
        clear
        echo ""
        echo "Detecting device"
        echo ""
        sleep 1
        fastboot devices >~/.AttachedDevices
        if grep 'device$\|fastboot$' ~/.AttachedDevices
        then
          echo "Device detected !"
          sleep 1
          clear
          echo ""
          echo "Flashing stable channel"
          echo ""
          sleep 1
          fastboot format cache
          fastboot format userdata
          fastboot reboot-bootloader
          sleep 6
          echo ""
          ubuntu-device-flash touch --channel ubuntu-touch/stable/ubuntu --device mako --bootstrap
          echo ""
          echo "Move to your device to finish the setup."
          sleep 1
          echo ""
          echo "Cleaning up.."
          rm -f ~/.AttachedDevices
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Device not found"
          exit
        fi
        echo "Device not found."
        exit
      else
        if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Invalid Option"
          echo ""
          echo "Exiting script. Bye Bye"
          exit
        fi
      fi
    else
      if [ "$ubuntuwipechannel" = "2" ]; then
        clear
        echo ""
        echo "Flashing rc-proposed channel"
        echo ""
        sleep 1
        echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
        echo ""
        sleep 1
        echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
        if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          fastboot devices >~/.AttachedDevices
          if grep 'device$\|fastboot$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing rc-proposed channel"
            echo ""
            sleep 1
            fastboot format cache
            fastboot format userdata
            fastboot reboot-bootloader
            sleep 6
            ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/ubuntu --device mako --bootstrap
            echo ""
            echo "Move to your device to finish the setup."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            echo ""
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      fi
    fi
  else
    if [ "$optionubuntu" = "2" ]; then
      clear
      echo ""
      echo "Choose a channel to flash "
      echo "Your Apps/Data won't be touched, it will just reinstall Ubuntu / switch the channel."
      echo ""
      sleep 1
      echo "[1] stable"
      echo "[2] rc-proposed"
      echo ""
      echo -n "Enter option: "; read ubuntukeepchannel
      if [ "$ubuntukeepchannel" = "1" ]; then
        clear
        echo ""
        echo "Flashing stable channel"
        echo ""
        sleep 1
        echo "Please boot you Nexus 4 into recovery mode by pressing Power & Vol -"
        echo "and choose recovery"
        echo ""
        sleep 1
        echo -n "Is your Nexus 4 in recovery mode now? [Y/N] "; read recoverymode
        if [ "$recoverymode"==Y -o "$recoverymode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          if grep 'device$\|recovery$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing stable channel"
            sleep 1
            echo ""
            ubuntu-device-flash touch --channel ubuntu-touch/stable/ubuntu --device mako
            echo ""
            echo "Move to your device to finish the setup."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$recoverymode"==N -o "$recoverymode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      else
        if [ "$ubuntukeepchannel" = "2" ]; then
          clear
          echo ""
          echo "Flashing rc-proposed channel"
          echo ""
          sleep 1
          echo "Please boot you Nexus 4 into recovery mode by pressing Power & Vol -"
          echo "and choose recovery"
          echo ""
          sleep 1
          echo -n "Is your Nexus 4 in recovery mode now? [Y/N] "; read bootloadermode
          if [ "$recoverymode"==Y -o "$recoverymode==y" ]; then
            echo ""
            echo "Detecting device"
            echo ""
            sleep 1
            adb devices >~/.AttachedDevices
            if grep 'device$\|recovery$' ~/.AttachedDevices
            then
              echo "Device detected !"
              sleep 1
              clear
              echo ""
              echo "Flashing rc-proposed channel"
              sleep 1
              echo ""
              ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/ubuntu --device mako
              echo ""
              echo "Move to your device to finish the setup."
              sleep 1
              echo ""
              echo "Cleaning up.."
              rm -f ~/.AttachedDevices
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Device not found"
              exit
            fi
            echo "Device not found."
            exit
          else
            if [ "$recoverymode"==N -o "$recoverymode==n"]; then
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Invalid Option"
              echo ""
              echo "Exiting script. Bye Bye"
              exit
            fi
          fi
        fi
      fi
    else
      echo ""
      echo "Exiting script. Bye Bye"
    fi
  fi
else
  if [ "$option" = "2" ]; then
    clear
    echo ""
    echo "Install Factory Image"
    echo ""
    echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
    sleep 1
    echo ""
    echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
    if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
      clear
      echo ""
      echo "Detecting device"
      echo ""
      sleep 1
      fastboot devices >~/.AttachedDevices
      if grep 'device$\|fastboot$' ~/.AttachedDevices
      then
        echo "Device detected !"
        sleep 1
        clear
        echo ""
        echo "Downloading factory image.."
        echo ""
        wget https://dl.google.com/dl/android/aosp/occam-lmy48t-factory-416938f1.tgz
        sleep 1
        tar xzf occam*
        sleep 1
        fastboot flash bootloader ./occam-lmy48t/bootloader-mako-makoz30f.img
        fastboot reboot-bootloader
        sleep 6
        fastboot -w update ./occam-lmy48t/image-occam-lmy48t.zip
        sleep 1
        echo ""
        echo "Move to your device to finish the setup."
        echo ""
        echo "Dont think your device is in a bootloop."
        echo "It can take up to 10 minutes until you see the android setup screen"
        sleep 2
        echo ""
        echo "Cleaning up.."
        rm -f ~/.AttachedDevices
        rm -rf ./occam-lmy48t
        rm -f ./*.tgz
        echo ""
        sleep 1
        echo "Exiting script. Bye Bye"
        sleep 1
        exit
      else
        echo "Device not found"
        exit
      fi
      echo "Device not found."
      exit
    else
      if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
        echo ""
        sleep 1
        echo "Exiting script. Bye Bye"
        sleep 1
        exit
      else
        echo "Invalid Option"
        echo ""
        echo "Exiting script. Bye Bye"
        exit
      fi
    fi
  else
    if [ "$option" = "3" ]; then
      clear
      echo ""
      echo "Install TWRP recovery"
      echo ""
      echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
      sleep 1
      echo ""
      echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
      if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
        clear
        echo ""
        echo "Detecting device"
        echo ""
        sleep 1
        fastboot devices >~/.AttachedDevices
        if grep 'device$\|fastboot$' ~/.AttachedDevices
        then
          echo "Device detected !"
          sleep 1
          clear
          echo ""
          echo "Downloading latest TWRP recovery image.."
          echo ""
          wget http://people.ubuntu.com/~misterq/phone/twrp-3.0.2-0-mako.img
          sleep 2
          echo "Installing TWRP..."
          fastboot flash recovery ./twrp-3.0.2-0-mako.img
          fastboot reboot-bootloader
          sleep 4
          echo ""
          echo "You can now boot into TWRP recovery"
          sleep 1
          echo ""
          echo "Cleaning up.."
          rm -f ./*.img
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Device not found"
          exit
        fi
        echo "Device not found."
        exit
      else
        if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Invalid Option"
          echo ""
          echo "Exiting script. Bye Bye"
          exit
        fi
      fi
    else
      if [ "$option" = "4" ]; then
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
          sleep 1
          echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
          echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
          if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
            clear
            echo ""
            echo "Detecting device"
            echo ""
            sleep 1
            fastboot devices >~/.AttachedDevices
            if grep 'device$\|fastboot$' ~/.AttachedDevices
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
              rm -f ~/.AttachedDevices
              echo ""
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Device not found"
              exit
            fi
            echo "Device not found."
            exit
          else
            if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Invalid Option"
              echo ""
              echo "Exiting script. Bye Bye"
              exit
            fi
          fi
        else
          if [ "$ulbootloader" = "2" ]; then
            clear
            echo ""
            echo "Unlock bootloader"
            echo ""
            sleep 1
            echo "Please boot you Nexus 4 into bootloader/fastboot mode by pressing Power & Vol -"
            echo -n "Is your Nexus 4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
            if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
              clear
              echo ""
              echo "Detecting device"
              echo ""
              sleep 1
              fastboot devices >~/.AttachedDevices
              if grep 'device$\|fastboot$' ~/.AttachedDevices
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
                rm -f ~/.AttachedDevices
                echo ""
                echo "Exiting script. Bye Bye"
                sleep 1
                exit
              else
                echo "Device not found"
                exit
              fi
              echo "Device not found."
              exit
            else
              if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
                echo ""
                sleep 1
                echo "Exiting script. Bye Bye"
                sleep 1
                exit
              else
                echo "Invalid Option"
                echo ""
                echo "Exiting script. Bye Bye"
                exit
              fi
            fi
          else
            if [ "$ulbootloader" = "3" ]; then
              echo "Quit"
              echo "Exiting script. Bye Bye"
            else
              echo "Exiting script. Bye Bye"
            fi
          fi
        fi
      else
        if [ "$option" = "5" ]; then
          echo "Exiting script. Bye Bye"
          exit
        else
          echo "Exiting script. Bye Bye"
        fi
      fi
    fi
  fi
fi
