#include "util.hpp"
#include <QFile>
#include <QXmlStreamReader>
#include <iostream>
#include <QFileInfo>

Util::Util()
{

}

Util::~Util()
{

}

void Util::addMessage(const QString & message)
{
    std::cout << message.toStdString() << std::endl;
}

void Util::addError(const QString & error)
{
    std::cout << "Error : " + error.toStdString() << std::endl;
}

void Util::showFile(const QString & path)
{
    QFile file(path);
    if (file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        Util::addMessage(file.readAll());
    }
    else
    {
        Util::addError("can not find " + QFileInfo(file).absoluteFilePath());
    }
}

QString Util::getLineFromConf(const QString & id)
{
    QString output = "";
    QFile file("./conf.xml");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        Util::addError("can not find the conf file "
                       + QFileInfo(file).absoluteFilePath());
        return QString();
    }
    QXmlStreamReader xml(&file);
    while (!xml.atEnd())
    {
        QXmlStreamReader::TokenType token = xml.readNext();
        if(token == QXmlStreamReader::StartElement)
        {
            if(xml.name() == id)
            {
                output = xml.readElementText();
            }
        }
    }
    if(!output.size())
        Util::addError("can not find config line '" + id + "'");
    return output;
}
