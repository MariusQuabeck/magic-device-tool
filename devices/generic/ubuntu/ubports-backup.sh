#!/bin/bash

function wait_for_user() {

    read -p "Hit Enter to continue..." tmp 

}

function wait_for_user_yesno() {

    while true; do
        read -p " (Y/n)" -n 1 answer
        case $answer in
            [Yy]* ) echo "y"; exit;;
            [Nn]* ) echo "n"; exit;;
            * ) echo "Please use only y or n.";;
        esac
    done 
}

function test_ssh_connection() {

    connection_test=$(adb shell "sudo -u phablet ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup $backup_user@$backup_server 'true; echo -n \$?'")
    echo $connection_test
}

function push_ssh_key() {

    echo "Pushing the local key to the device..."
    adb shell "sudo -u phablet mkdir -p /home/phablet/.ssh"
    adb push $HOME/.ssh/id_ubports-backup /home/phablet/.ssh
    adb shell "sudo -u phablet chmod 600 /home/phablet/.ssh/id_ubports-backup"
    adb push $HOME/.ssh/id_ubports-backup.pub /home/phablet/.ssh

}


function do_ssh_setup() {

    echo ""
    echo "SSH setup"
    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    echo "Testing if an ssh key for ubports-backup exists on the mobile device..."
    device_key_missing=$(adb shell "sudo -u phablet bash -c 'if [ -e "/home/phablet/.ssh/id_ubports-backup" ]; then echo -n 0; else echo -n 1; fi'")
    if [ "$device_key_missing" -eq "1" ]; then
        if [ -e "$HOME/.ssh/id_ubports-backup" ]; then
            echo -n "No key was found on device $device, but it exists locally. Shall we use the local key?"
            use_local_key=$(wait_for_user_yesno)
            echo ""
            if [ "$use_local_key" == "y" ]; then
                push_ssh_key
            else
                echo "You need to manually remove the local key \$HOME/.shh/id_ubports-backup if you dont want to use it, a new one will be then generated at the next start of the backup script."
                return
            fi 
        else
            echo -n "No key was found on device $device, shall we create a new key and transfer it?"
            generate_key=$(wait_for_user_yesno)
            echo ""
            if [ "$generate_key" == "y" ]; then
                echo "Generating new 2048bit ssh key for ubports-backup (you can find it later in your $HOME/.ssh directory)..."
                ssh-keygen -t rsa -N "" -f $HOME/.ssh/id_ubports-backup
                push_ssh_key
            else
                echo "No key found, ssh setup not finished"
                return
            fi
        fi 
    else
        echo "Found a key on the device!"
    fi
    echo "Testing if we can connect to $backup_server without a password"
    result="$(test_ssh_connection)"
    if [ "$result" != "0" ]; then
        echo "We could not connect to the backup server without a password, shall we try to upload the public key? Your remote ssh password will be needed"
        if [ "$(wait_for_user_yesno)" == "y" ]; then
            ssh-copy-id -i $HOME/.ssh/id_ubports-backup.pub $backup_user@$backup_server
            echo "Testing if we can connect to $backup_server without a password"
            result=$(test_ssh_connection)
            if [ "$result" != "0" ]; then
                echo "We could not connect to the remote server, even after publishing the key. Exiting..."
                return
            fi
        else
            echo "We could not login to the backup server with a public key and you did not want me to upload it, exiting..."
            return
        fi
    fi
    echo_green "SSH Setup & Test OK!"
}

function do_servertest() {

    echo "Checking folder structure on remote server"
    shell_cmd="'mkdir -p $backup_folder/ubports_backup/$device; cd $backup_folder/ubports_backup/$device; echo -n \$?'"
    result=$(adb shell "sudo -u phablet ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup $backup_user@$backup_server $shell_cmd")
    if [ "$result" == "0" ]; then
        echo_green "Servertest OK!"
    else
        echo_red "Servertest NOT OK!"
        echo "adb result was: $result"
    fi

}

function find_sdcard() {

    printf %q "$(adb shell "ls /media/phablet 2> /dev/null | head -n +3" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

}

function do_backup() {

    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    adb shell "rm /tmp/ubports-backup.log 2> /dev/null"
    if [ "$backup_target" = "sdcard" ]; then
        sdcard=$(find_sdcard)
        if [ -z "$sdcard" ]; then
            echo "No SD card found, please check your setup."
            return
        else
            echo "Now doing backup to SD card $sdcard..."
            adb shell "mkdir -p /media/phablet/$sdcard/$backup_folder/ubports_backup/$device"
            adb shell "sudo -u phablet rsync -az --no-links --delete --info=progress2 /home/phablet/ /media/phablet/$sdcard/$backup_folder/ubports_backup/$device/ | tee /tmp/ubports-backup.log; echo -n \${PIPESTATUS[0]} >> /tmp/ubports-backup.log"
        fi
    else
        do_ssh_setup
        do_servertest
        echo "Now doing backup..."
        adb shell "sudo -u phablet rsync -e 'ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup' -az --no-links --delete --info=progress2 /home/phablet/ $backup_user@$backup_server:$backup_folder/ubports_backup/$device/ | tee /tmp/ubports-backup.log; echo -n \${PIPESTATUS[0]} >> /tmp/ubports-backup.log"
    fi
    result=$(adb shell "tail -1 /tmp/ubports-backup.log")
    echo "" 
    if [ "$result" = "0" ]; then
        echo_green "Backup OK!"
    else
        echo_red_high "Backup NOT OK!"
    fi
}

function do_backup_available_folders() {

    echo "Checking which backups exist on the server"

    if [ "$backup_target" = "sdcard" ]; then
        sdcard=$(find_sdcard)
        result=$(adb shell "ls /media/phablet/$sdcard/$backup_folder/ubports_backup/")
    else
        shell_cmd="ls $backup_folder/ubports_backup/"
        result=$(ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i $HOME/.ssh/id_ubports-backup $backup_user@$backup_server $shell_cmd)
    fi
    echo $result
    origin_device="XXXXXXX"
    echo ""
    while [[ $result != *$origin_device* ]]; do
        read -p "Please enter a device id which should be used for restore or press enter to return to the menu: " origin_device
    done

}


function do_restore() {

    if [ -z $device ]; then
        echo "No device connected, cannot continue!"
        return
    fi
    if [ "$backup_target" = "ssh" ]; then
        do_ssh_setup
        do_servertest
    fi
    do_backup_available_folders
    if [ "$origin_device" = "" ]; then
        echo "Restore cancelled!"
        return
    fi 
    echo "Source: $origin_device => Destination: $device"
    echo -n "CAUTION! This will overwrite your device data now! Proceed?"
    if [ $(wait_for_user_yesno) = "y" ]; then
        adb shell "rm /tmp/ubports-backup.log 2> /dev/null"
        if [ "$backup_target" = "sdcard" ]; then
            sdcard=$(find_sdcard)
            if [ -z "$sdcard" ]; then
                echo "No SD card found, please check your setup."
            else
                echo "Now doing restore from SD card $sdcard..."
                adb shell "sudo -u phablet rsync -az --no-links --delete --info=progress2 /media/phablet/$sdcard/$backup_folder/ubports_backup/$origin_device/ /home/phablet/ | tee /tmp/ubports-backup.log; echo -n \${PIPESTATUS[0]} >> /tmp/ubports-backup.log"
            fi
        else
            echo ""
            echo "Now doing restore..."
	    adb shell "sudo -u phablet rsync -e 'ssh -oStrictHostKeyChecking=no -oPasswordAuthentication=no -i /home/phablet/.ssh/id_ubports-backup' -az --no-links --delete --info=progress2 $backup_user@$backup_server:$backup_folder/ubports_backup/$origin_device/ /home/phablet/ | tee /tmp/ubports-backup.log; echo -n \${PIPESTATUS[0]} >> /tmp/ubports-backup.log"
        fi
        adb shell "chmod 0600 \$HOME/.ssh/id_ubports-backup*"
        result=$(adb shell "tail -1 /tmp/ubports-backup.log")
        echo "" 
        if [ "$result" = "0" ]; then
            echo_green "Restore OK!"
            echo "Restore finished, rebooting device..."
            adb reboot
        else
            adb shell "tail -20 /tmp/ubports-backup.log"
            echo_red_high "Restore NOT OK, your device may be in an unsuable state!"
        fi
    else
        echo "Cancelled restore."
    fi
}

function switch_mode() {
   if [ $advanced_mode -eq "0" ]; then
      write_setting ubports_backup advanced_mode 1
   else
      write_setting ubports_backup advanced_mode 0
   fi
}

function switch_target() {
    if [ $backup_target = "sdcard" ]; then
        write_setting ubports_backup backup_target ssh
    else
        write_setting ubports_backup backup_target sdcard
    fi
}

adb start-server

while [ 1 ]; do
    clear
    backup_target=$(read_setting ubports_backup backup_target "sdcard")
    advanced_mode=$(read_setting ubports_backup advanced_mode "0")
    backup_server=$(read_setting ubports_backup backup_server)
    backup_server_ok=$(read_setting ubports_backup backup_server_ok "not tested")
    backup_user=$(read_setting ubports_backup backup_user)
    if [ "$advanced_mode" -eq "1" ]; then
        backup_folder=$(read_setting ubports_backup backup_folder)
    else
        backup_folder="."
    fi
    ssh_key=$(read_setting ubports_backup custom_ssh_key "id_rsa")
    echo ""
    echo "UBports (tiny) Backup"
    echo ""
    echo "This module will make a simple backup or restore of the user data in your UBports device. It is currently in alpha stage and no liability is taken for lost data."
    echo "NOTE: Currently it is not possible to make a backup of installed Apps, we hope to provide this on a later stage..."
    echo ""
    echo "The things You will need:"
    echo ""
    echo "For backup to SD cards:"
    echo "*) An SD card inserted in your phone"
    echo ""
    echo "OR"
    echo ""
    echo "For backup to remote PCs or servers:"
    echo "*) the DNS name or IP address of a backup server that can be used with scp/rsync"
    echo "*) your username on this server"
    echo "*) (optional) a path to the remote directory, which will be used to store the backup: \$HOME/<optional_folder>/ubports_backup/<device_id> - enable advanced mode for this to work."
    echo ""
    echo "The script will create its own SSH key pair which will be then also pushed to the device. Currently we only support one username and one backup server!"
    echo ""
    echo "Currently the following settings are configured:"
    echo ""
    if [ "$backup_target" = "sdcard" ]; then
        echo "Backup/Restore to/from SD card"
    else
        echo "Backup/Restore to/from ssh server"
        echo "Backup server: $backup_server"
        echo "Username: $backup_user"
        echo "Server status: $backup_server_ok"
    fi
    device=$(adb devices | grep -w device | cut -f1)
    echo "Device currently connected: $device"
    if [ -z $device ]; then
        echo ""
        echo_red "No device detected! Please make sure developer mode is on and you have authorized this PC to connect with adb to the phone."
        echo_red "Return to the previous menu and select the backup option again to restart."
        echo ""
    fi
    if [ "$advanced_mode" -eq "1" ]; then 
        if [ "$backup_target" = "sdcard" ]; then
            echo "Current backup path: /media/phablet/<SDCARD_NAME>/$backup_folder/ubports_backup/$device" 
        else
            echo "Current backup path: $backup_user@$backup_server:\$HOME/$backup_folder/ubports_backup/$device" 
        fi
    else
        if [ "$backup_target" = "sdcard" ]; then
            echo "Current backup path: /media/phablet/<SDCARD_NAME>/ubports_backup/$device" 
        else
            echo "Current backup path: $backup_user@$backup_server:\$HOME/ubports_backup/$device" 
        fi
    fi
    sleep 1
    echo ""
    echo ""
    echo "[1] Switch backup target"
    echo ""
    echo "[2] Change backup server"
    echo ""
    echo "[3] Change username"
    echo ""
    echo "[4] Backup device $device"
    echo ""
    echo "[5] Restore device $device"
    echo ""
    if [ "$advanced_mode" -eq "1" ]; then 
        echo "[6] Change optional folder"
        echo ""
        if [ "$backup_target" = "ssh" ]; then
            echo "[7] Test ssh setup"
            echo ""
            echo "[8] Test server setup"
        fi
        echo ""
        echo "[9] Switch to simple mode"
    else
        echo "[9] Switch to advanced mode"
    fi
    echo ""
    echo "[0] Back to main MDT menu"
    echo ""
    echo -n "Enter option: "; read option
    case "$option" in
        1)
            switch_target
        ;;
        2)
            query_user_setting "Enter the dns name or the IP address of the backup server: " ubports_backup backup_server
        ;;
        3)
        query_user_setting "Enter the username: " ubports_backup backup_user
        ;;
        4)
            do_backup
            wait_for_user
        ;;
        5)
            do_restore
            wait_for_user
        ;;
        6)
            if [ "$advanced_mode" -eq "1" ]; then
                query_user_setting "Enter the folder name RELATIVE to \$HOME: " ubports_backup backup_folder
            fi
        ;; 
        7)
            if [ "$advanced_mode" -eq "1" ]; then
                do_ssh_setup
                wait_for_user
            fi
        ;;
        8)
            if [ "$advanced_mode" -eq "1" ]; then
                do_servertest
                wait_for_user
            fi
        ;;
        9)
            switch_mode
        ;;
        0)
            . ./launcher.sh
        ;; 
    esac
done

