#include "mdt.h"
#include "ui_mdt.h"
#include <QProcess>
#include <QDebug>

void mdt::fill_options()
{
    opengapps = "http://mdt-files.com/downloads/magic-device-tool/gapps/open_gapps-arm-7.1-nano-20170126.zip";
    fdroidota = "https://f-droid.org/repo/org.fdroid.fdroid.privileged.ota_2040.zip";
    //General
    fastboot_format
            << "fastboot format system"
            << "fastboot format cache"
            << "fastboot format userdata"
            << "fastboot reboot-bootloader"
            << "sleep 8";

    install_OpenStore = "adb shell \"cd Downloads && wget -c --quiet --show-progress --tries=10 "
                        "https://open.uappexplorer.com/api/download/openstore.openstore-team/openstore.openstore-team_latest_armhf.click "
                        "&& pkcon install-local --allow-untrusted openstore.openstore-team_latest_armhf.click "
                        "&& rm openstore.openstore-team_latest_armhf.click && exit\"";

    opengapps_filename = get_filename(opengapps);
    wget = "wget -c --quiet --show-progress --tries=10 -P " + HOME + " ";

    //Devices and options
    devices_list
            //<< "BQ Aquaris E4.5 (krillin)"
            //<< "BQ Aquaris E5 HD (vegetahd)"
            //<< "BQ Aquaris M10 HD (cooler)"
            //<< "BQ Aquaris M10 FHD (frieza)"
            //<< "Meizu MX 4 (arale)"
            //<< "Meizu Pro 5 (turbo)"
            << "LG Nexus 4 (mako)"
            //<< "LG Nexus 5 (hammerhead)"
            //<< "Asus Nexus 7 2013 WiFi (flo)"
            //<< "Asus Nexus 7 2013 LTE (deb)"
            //<< "Samsung Nexus 10 (manta)"
            //<< "OnePlus One (bacon)"
            //<< "Fairphone 2 (FP2)"
               ;
    actions_generic
            << "Install LineageOS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)"
               ;
    actions_krillin
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast";
    actions_vegetahd
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast";
    actions_cooler
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast";
    actions_frieza
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast";
    actions_arale
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast"
            << "Install Cyanogenmod 13"
            << "Install Cyanogenmod 13 without Gapps"
            << "Back Up your Android device";
    actions_turbo
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast";
    actions_mako
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Install LineageOS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_hammerhead
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Install Cyanogenmod"
            << "Install Maru OS"
            << "Install Sailfish OS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_flo
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Screencast"
            << "Install LineageOS"
            << "Install Sailfish OS"
            << "Install Phoenix OS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_deb
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Install Cyanogenmod"
            << "Install Sailfish OS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_manta
            << "Install Cyanogenmod 13"
            << "Install Phoenix OS"
            << "Install Factory Image"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_bacon
            << "Install Ubuntu"
            << "Install OpenStore"
            << "Install Cyanogenmod 13"
            << "Install Cyanogenmod 13 without Gapps"
            << "Install Sailfish OS"
            << "Install TWRP recovery"
            << "Back Up your Android device"
            << "Lock/Unlock bootloader (Will wipe existing apps/data)";
    actions_FP2
            << "Install Ubuntu"
            << "Install OpenStore";
    options_Install_Ubuntu
            << "Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
            << "Choose a channel to switch your device to (Will keep existing apps/data)";
    options_Install_LineageOS
            << "Standard"
            << "with GApps"
            << "with F-Droid";
    options_Ubuntu_Channel
            <<  "stable"
             <<  "rc-proposed";
    options_Bootloader
            << "Lock Bootloader"
            << "Unlock Bootloader";
    options_Backup
            << "Create a backup"
            << "Restore from a backup";
}

void mdt::set_actions(QString device)
{
    ui->label_Top->setText("Your Device: " + device);
    ui->listWidget->clear();
    if (device == "BQ Aquaris E4.5 (krillin)")
        ui->listWidget->addItems(actions_krillin);
    else if (device == "BQ Aquaris E5 HD (vegetahd)")
        ui->listWidget->addItems(actions_vegetahd);
    else if (device == "BQ Aquaris M10 HD (cooler)")
        ui->listWidget->addItems(actions_cooler);
    else if (device == "BQ Aquaris M10 FHD (frieza)")
        ui->listWidget->addItems(actions_frieza);
    else if (device == "Meizu MX 4 (arale)")
        ui->listWidget->addItems(actions_arale);
    else if (device == "Meizu Pro 5 (turbo)")
        ui->listWidget->addItems(actions_turbo);
    else if (device == "LG Nexus 4 (mako)")
        ui->listWidget->addItems(actions_mako);
    else if (device == "LG Nexus 5 (hammerhead)")
        ui->listWidget->addItems(actions_hammerhead);
    else if (device == "Asus Nexus 7 2013 WiFi (flo)")
        ui->listWidget->addItems(actions_flo);
    else if (device == "Asus Nexus 7 2013 LTE (deb)")
        ui->listWidget->addItems(actions_deb);
    else if (device == "Samsung Nexus 10 (manta)")
        ui->listWidget->addItems(actions_manta);
    else if (device == "OnePlus One (bacon)")
        ui->listWidget->addItems(actions_bacon);
    else if (device ==  "Fairphone 2 (FP2)")
        ui->listWidget->addItems(actions_FP2);
    else
        ui->listWidget->addItems(actions_generic);
    ui->listWidget->setCurrentRow(0);
}

void mdt::set_Information()
{
    //This should be called after all selections are done. It will show all Information again, and offer a Start Button
    ui->listWidget->setVisible(false);
    ui->pushButton_Next->setVisible(false);
    ui->pushButton_Back->setVisible(false);
    ui->label_Information->setVisible(true);
    QString Information = "1. Choice: " + device + "\n2. Choice: " + action + "\n";
    if (option != "None")
    {
        Information = Information + "3. Choice: " + option;
        if (channel != "None")
        {
            Information = Information + "\n4. Choice: " + channel;
        }
    }

    if (action == "Install Ubuntu" || action == "Install LineageOS" || action.contains("loader") || action == "Install Factory Image")
        //or other fastboot needing options
    {
        qDebug() << "ask for fastboot";
        Information = Information + "\n\nNow please make sure you do these things before you press \"Start!\":"
                                    "\n- Please put your device into fastboot mode now, by pressing "
                + Information_fastboot(device)
                + "\n- Connect the device to your PC via USB";
    }
    else if (action == "Install Openstore")
    {
        Information + "\n\nNow please make sure you do these things before you press \"Start!\":" +
                "\n- Enable developermode on the device. It is located in system-settings -> About -> Developermode."
                "\n- If this is your first time connecting with adb, accept the dialog on your device";
        QProcess *adb_server = new QProcess;
        adb_server->start("adb start-server");
    }

    ui->label_Information->setText(Information);
    ui->pushButton_Cancel->setVisible(true);
    ui->pushButton_Start->setVisible(true);
}

QString mdt::Information_fastboot(QString device)
{
    QString info;
    if (device == "BQ Aquaris E4.5 (krillin)")
        info = "Power and Volume up";
    else if (device == "BQ Aquaris E5 HD (vegetahd)")
        info = "Power and Volume up";
    else if (device == "BQ Aquaris M10 HD (cooler)")
        info = "adb";
    else if (device == "BQ Aquaris M10 FHD (frieza)")
        info = "adb";
    else if (device == "Meizu MX 4 (arale)")
        info = "Power & Volume down";
    else if (device == "Meizu Pro 5 (turbo)")
        info = "adb";
    else if (device == "LG Nexus 4 (mako)")
        info = "Power and Volume down";
    else if (device == "LG Nexus 5 (hammerhead)")
        info = "Power and Volume down";
    else if (device == "Asus Nexus 7 2013 WiFi (flo)")
        info = "Power and Volume down";
    else if (device == "Asus Nexus 7 2013 LTE (deb)")
        info = "Power and Volume down";
    else if (device == "Samsung Nexus 10 (manta)")
        info = "Power and Volume up";
    else if (device == "OnePlus One (bacon)")
        info = "Power and Volume up";
    else if (device ==  "Fairphone 2 (FP2)")
        info = "Power and Volume down";
    return info;
}

bool mdt::set_options(QString action)
{
    ui->listWidget->clear();
    if (action == "Install Ubuntu")
    {
        ui->listWidget->addItems(options_Install_Ubuntu);
        ui->listWidget->setCurrentRow(0);
        return false;
    }
    else if (action.contains("loader"))
    {
        ui->listWidget->addItems(options_Bootloader);
        ui->listWidget->setCurrentRow(0);
        return false;
    }
    else if (action == "Install LineageOS")
    {
        ui->listWidget->addItems(options_Install_LineageOS);
        ui->listWidget->setCurrentRow(0);
        return false;
    }
    else if (action.contains("Back up"))
    {
        ui->listWidget->addItems(options_Backup);
        ui->listWidget->setCurrentRow(0);
        return false;
    }
    else
    {
        return true;
    }
}

bool mdt::set_channel(QString option)
{
    ui->listWidget->clear();
    if (option.contains("channel"))
    {
        ui->listWidget->addItems(options_Ubuntu_Channel);
        ui->listWidget->setCurrentRow(0);
        return false;
    }
    else
    {
        return true;
    }
}


