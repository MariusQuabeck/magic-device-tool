#include "mdt.h"
#include <QDebug>

QStringList mdt::get_Android_Install(QString recovery, QString image, QString extras)
{
    QStringList result;
    result << fastboot_format
           << wget + recovery
           << wget + image
           << "fastboot flash recovery " + HOME + get_filename(recovery)
           << "fastboot reboot-bootloader"
           << "sleep 7"
           << "fastboot boot " + HOME + get_filename(recovery)
           << "sleep 15"
           << "adb reboot recovery"
           << "sleep 15"
           << "adb push -p " + HOME + get_filename(image) + " /sdcard/"
           << "adb shell twrp install /sdcard/" + get_filename(image)
           << "adb shell twrp wipe cache"
           << "adb reboot";
    if (extras != "None")
    {
        result.insert(5, wget + extras);
        result.insert(15, "adb push -p " + HOME + get_filename(extras) + " /sdcard/");
        result.insert(18, "adb shell twrp install /sdcard/" + get_filename(extras));
    }
    qDebug() << result;
    return result;
}

QStringList mdt::get_TWRP_Install(QString recovery)
{
    QStringList result;
    result << wget + recovery
           << "fastboot flash recovery " + HOME + get_filename(recovery)
           << "fastboot reboot-bootloader"
           << "sleep 7"
           << "fastboot boot " + HOME + get_filename(recovery);
    qDebug() << result;
    return result;
}

QStringList mdt::get_Factory_Install(QString image)
{
    QStringList result;
    result << wget + image
           << "unzip -od " + HOME + " " + HOME + "occam*.zip"
           /*<< "fastboot flash bootloader " + HOME + get_filename(image) + "/bootloader-*"
           << "fastboot reboot-bootloader"
           << "sleep 6"
           << "fastboot flash radio " + HOME + get_filename(image) + "/radio-*"
           << "fastboot reboot-bootloader"
           << "sleep 6"*/
           << "fastboot -w update " + HOME + get_filename(image) + "/image-" + get_filename(image) + ".zip";
    qDebug() << result;
    return result;
}


