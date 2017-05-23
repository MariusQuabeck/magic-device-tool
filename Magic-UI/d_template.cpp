#include "mdt.h"
#include "ui_mdt.h"
#include <QDebug>


void mdt::nexus4(QString action, QString option, QString channel)
{
    //Device-specific Links:
    QString twrp_mako = "https://eu.dl.twrp.me/mako/twrp-3.1.1-0-mako.img";
    QString lineageos_mako = "https://lineageos.mirrorhub.io/full/mako/20170427/lineage-14.1-20170427-nightly-mako-signed.zip";
    QString factory_mako = "https://dl.google.com/dl/android/aosp/occam-lmy48t-factory-c43c7cfd.zip";//"https://dl.google.com/dl/android/aosp/occam-lmy48t-factory-416938f1.tgz";
    //https://dl.google.com/dl/android/aosp/occam-lmy48t-factory-c43c7cfd.zip
    if (action == "Install Ubuntu")
    {
        if (device_connected("fastboot"))
        {
            orders << fastboot_format
                   << udf_wrapper(device, option, channel);
            execute();
        }

    }
    else if (action == "Install OpenStore")
    {
        if (device_connected("adb"))
        {
            orders << install_OpenStore;
            execute();
        }
    }
    else if (action == "Install LineageOS")
    {
        if (device_connected("fastboot"))
        {
            if (option == "with GApps")
            {
                orders << get_Android_Install(twrp_mako, lineageos_mako, opengapps);
                execute();
            }
            else if (option == "with F-Droid")
            {
                orders << get_Android_Install(twrp_mako, lineageos_mako, fdroidota);
                execute();
            }
            else if (option == "Standard")
            {
                orders << get_Android_Install(twrp_mako, lineageos_mako, "None");
                execute();
            }
        }
    }
    else if (action == "Install Sailfish OS")
    {

    }
    else if (action == "Install Factory Image")
    {
        if (device_connected("fastboot"))
        {
            orders << get_Factory_Install(factory_mako);
            execute();
        }
    }
    else if (action == "Install TWRP recovery")
    {
        if (device_connected("fastboot"))
        {
            orders << get_TWRP_Install(twrp_mako);
            execute();
        }
    }
    else if (action == "Back Up your Android device")
    {
        if (device_connected("adb"))
        {
            orders << adb_Backup(option);
            execute();
        }
    }
    else if (action == "Lock/Unlock bootloader (Will wipe existing apps/data)")
    {
        if (device_connected("fastboot"))
        {
            orders << fastboot_locking(option);
            execute();
        }
    }
}

