#include "mdt.h"
#include "ui_mdt.h"
#include <QProcess>
#include <QDebug>

void mdt::execute()
{
    QString command = orders[process_number];
    qDebug() << command;
    display_current(command);
    Process->start(command);
}

void mdt::execute_helper()
{
    process_number++;
    disconnect(Process, SIGNAL(finished(int,QProcess::ExitStatus)), this, SLOT(execute_helper()));
    Process->close();
    qDebug() << "Helperfn!";
    if (orders.length() <= process_number)
    {
        process_number = 0;
        Process->close();
        orders.clear();
        reset_everything();
        qDebug() << "Done";
    }
    else if (orders.length() > process_number)
    {
        //qDebug() << process_number;
        connect(Process, SIGNAL(finished(int,QProcess::ExitStatus)), this, SLOT(execute_helper()));
        execute();
    }
}


void mdt::read_Stout()
{
    output = Process->readAllStandardOutput();
    error = Process->readAllStandardError();
    qDebug() << error;
    qDebug() << output;
    if (error.contains("%"))
    {
        ui->progressBar->setVisible(true);
        if (error.contains("Transferring"))
        {
            ui->progressBar->setValue(error.mid((error.indexOf("(")+1), (error.indexOf(")") - error.indexOf("(") - 2)).toInt());
        }
        else
        {
            ui->progressBar->setValue(error.mid((error.indexOf("%")-3), 3).toInt());
        }
    }
}
