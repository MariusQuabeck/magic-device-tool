#!/bin/bash
clear
echo ""
echo "BQ Aquaris M10 HD - cooler"
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Quit "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  clear
  adb start-server
  echo "  "
  echo "Install Ubuntu"
  echo ""
  sleep 1
  echo "[1] Choose a channel to flash (Will wipe existing data)"
  echo "[2] Choose a channel to flash / Switch channel (Keep existing apps/data) "
  sleep 1
  echo ""
  echo -n "Enter option: "; read optionubuntu
  if [ "$optionubuntu" = "1" ]; then
    clear
    echo ""
    echo "Choose a channel to flash (Will wipe existing data)"
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
      echo "Please enable developer mode on the device"
      echo "this is located in system-settings → About → Developer Mode"
      echo ""
      echo "Please confirm the pairing dialog on the device"
      echo ""
      sleep 1
      echo -n "Did you enable developer mode ? [Y/N] "; read developermode
      if [ "$developermode"==Y -o "$developermode==y" ]; then
        clear
        echo ""
        echo "Detecting device"
        echo ""
        sleep 1
        adb devices >~/.AttachedDevices
        echo ""
        sleep 1
        if grep 'device$\|device$' ~/.AttachedDevices
        then
          echo ""
          echo "Device detected !"
          sleep 1
          clear
          echo ""
          echo "Flashing stable channel"
          echo ""
          adb reboot-bootloader
          echo "Please wait"
          sleep 6
          wget http://people.canonical.com/~abeato/avila/cooler/recovery-cooler.img
          sleep 1
          clear
          echo ""
          ubuntu-device-flash touch --bootstrap --device cooler --channel ubuntu-touch/stable/bq-aquaris-pd.en --recovery-image recovery-cooler.img
          sleep 1
          echo ""
          echo "Rest of the setup will be on your device."
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
          exit
        fi
        echo "Device not found."
        exit
      else
        if [ "$developermode"==N -o "$developermode==n"]; then
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
        echo "Please enable developer mode on the device"
        echo "this is located in system-settings → About → Developer Mode"
        echo ""
        echo "Please confirm the pairing dialog on the device"
        echo ""
        sleep 1
        echo -n "Did you enable developer mode ? [Y/N] "; read developermode
        if [ "$developermode"==Y -o "$developermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          echo ""
          sleep 1
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
            echo "Rest of the setup will be on your device."
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
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$developermode"==N -o "$developermode==n"]; then
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
      echo "Choose a channel to flash / Switch channel "
      echo "Your Apps/Data wont be touched, it will just reinstall Ubuntu / switch the channel."
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
        echo "Please enable developer mode on the device"
        echo "this is located in system-settings → About → Developer Mode"
        echo ""
        echo "Please confirm the pairing dialog on the device"
        echo ""
        sleep 1
        echo -n "Did you enable developer mode ? [Y/N] "; read developermode
        if [ "$developermode"==Y -o "$developermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          echo ""
          sleep 1
          if grep 'device$\|device$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing stable channel"
            echo ""
            adb reboot-bootloader
            echo "Please wait"
            echo ""
            sleep 7
            wget http://people.canonical.com/~abeato/avila/cooler/recovery-cooler.img
            sleep 1
            fastboot flash recovery recovery-cooler.img
            sleep 1
            fastboot boot recovery-cooler.img
            sleep 10
            adb reboot recovery
            sleep 17
            clear
            echo ""
            ubuntu-device-flash touch --device cooler --channel ubuntu-touch/stable/bq-aquaris-pd.en
            sleep 1
            echo ""
            echo "Rest of the setup will be on your device."
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
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$developermode"==N -o "$developermode==n"]; then
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
          echo "Please enable developer mode on the device"
          echo "this is located in system-settings → About → Developer Mode"
          echo ""
          echo "Please confirm the pairing dialog on the device"
          echo ""
          sleep 1
          echo -n "Did you enable developer mode ? [Y/N] "; read developermode
          if [ "$developermode"==Y -o "$developermode==y" ]; then
            clear
            echo ""
            echo "Detecting device"
            echo ""
            sleep 1
            adb devices >~/.AttachedDevices
            echo ""
            sleep 1
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
              sleep 7
              wget http://people.canonical.com/~abeato/avila/cooler/recovery-cooler.img
              sleep 1
              fastboot flash recovery recovery-cooler.img
              sleep 1
              fastboot boot recovery-cooler.img
              sleep 10
              adb reboot recovery
              sleep 17
              clear
              echo ""
              ubuntu-device-flash touch --device cooler --channel ubuntu-touch/rc-proposed/bq-aquaris-pd.en
              sleep 1
              echo ""
              echo "Rest of the setup will be on your device."
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
              exit
            fi
            echo "Device not found."
            exit
          else
            if [ "$developermode"==N -o "$developermode==n"]; then
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
          echo "Exiting script. Bye Bye"
          exit
        else
          echo "Exiting script. Bye Bye"
        fi
      fi
