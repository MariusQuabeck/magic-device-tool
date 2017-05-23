#include "mdt.h"
#include <QDebug>
#include "ui_mdt.h"

void mdt::display_current(QString command)
{
    qDebug() << "display stuff";
    ui->label_Process_Info->setVisible(true);
    if (command.contains("wget"))
    {
        if (command.contains("lineageos"))
        {
            ui->label_Process_Info->setText("Downloading LineageOS");
        }
        else if (command.contains("gapps"))
        {
            ui->label_Process_Info->setText("Downloading OpenGApps");
        }
        else if (command.contains("twrp"))
        {
            ui->label_Process_Info->setText("Downloading TWRP-Recovery");
        }
        ui->progressBar->setVisible(true);
    }
    else if (command.contains("adb push"))
    {
        if (command.contains("lineage"))
        {
            ui->label_Process_Info->setText("Pushing LineageOS files to device");
        }
        else if (command.contains("open_gapps"))
        {
            ui->label_Process_Info->setText("Pushing GApps files to device");
        }
        ui->progressBar->setVisible(true);
    }
    else if (command.contains("adb shell twrp install"))
    {
        ui->label_Process_Info->setText("Flashing images on your device");
    }
    else if (command.contains(("fastboot format")))
    {
        ui->label_Process_Info->setText("Erasing system and userdata");
    }
    else if (command.contains("fastboot flash"))
    {
        ui->label_Process_Info->setText("Flashing Recovery to your device");
    }
    else if (command.contains("fastboot -w update"))
    {
        ui->label_Process_Info->setText("Installing Factory Image");
    }
    else if (command.contains("sleep"))
    {
        ui->label_Process_Info->setText("Wait for " + command.mid(6) + " seconds");
    }
    else if (command.contains("ubuntu-device-flash"))
    {
        ui->label_Process_Info->setText("using ubuntu-device-flash");
    }
    else
    {
        ui->label_Process_Info->setText(command);
        ui->progressBar->setVisible(false);
    }
}

//Button actions:

void mdt::on_pushButton_Start_clicked()
{
    call_for_action();
    ui->pushButton_Start->setEnabled(false);
}

void mdt::on_pushButton_Cancel_clicked()
{
    reset_everything();
}

void mdt::on_listWidget_activated(const QModelIndex &index)
{
    on_pushButton_Next_clicked();
}

void mdt::on_pushButton_Back_clicked()
{
    step--;
    if (step == 0)
    {
        reset_everything();
    }
    else if (step == 1)
    {
        set_actions(device);
        option = "";
    }
    else if (step == 2)
    {
        set_options(action);
        channel = "";
    }
}

void mdt::on_pushButton_Next_clicked()
{
    step++;
    if (step == 1)
    {
        device = ui->listWidget->currentItem()->text();
        set_actions(device);
        ui->pushButton_Back->setVisible(true);
    }
    else if (step == 2)
    {
        action = ui->listWidget->currentItem()->text();
        if (set_options(action))    //returns true if there are no options left
        {
            set_Information();
        }
    }
    else if (step == 3)
    {
        option = ui->listWidget->currentItem()->text();
        if (set_channel(option))
        {
            set_Information();
        }
    }
    else if (step == 4)
    {
        channel = ui->listWidget->currentItem()->text();
        set_Information();
    }
    else
    {
        qDebug() << "No viable step!";
    }
}
