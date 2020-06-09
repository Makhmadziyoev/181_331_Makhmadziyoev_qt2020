#include "cryptocontroller.h"
#include <QtDebug>
#include <iostream>
#include <QChar>
#include <QIODevice>
#include <QDataStream>
#include <cstring>

CryptoController::CryptoController(QObject *parent) : QObject(parent)
{

}

void CryptoController::setPath(QString p)
{
    path = p;

}

void CryptoController::encryption(QString key)
{
    qDebug() << "Encrypt start";
    openfiles();

    this->key = (unsigned char*) (key.toLatin1().data());
    qDebug()<< key.toLatin1();
    qDebug() << key.toLatin1().length();
    if (crypt_perm)
    {
        QDataStream in(&f_tt);
        QDataStream out(&f_encrypted);

        char buffer[256] = { 0 };
        char out_buf[256] = { 0 };

        ctx = EVP_CIPHER_CTX_new();
        EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), nullptr, this->key, iv);
        qDebug() << "EVP_EncryptInit_ex \n";
        int buff_len = 256;
        int len = 0;
        int readlen;

        readlen = in.readRawData(buffer, 256);
        while (readlen > 0)
        {
            //шифрование
            EVP_EncryptUpdate(ctx,//объект с настройками
                              (unsigned char *)out_buf,//входной параметр: ссылка, куда помещать зашифрованные данные
                              &len, //выходной параметр: длина полученного шифра
                              (unsigned char *)buffer, //входной параметр : длинна входных данных
                              readlen); //входной параметр : длина входных данных


            qDebug() << "EVP_EncryptUpdate \n";

            //вывод зашифрованых порций в файл
            out.writeRawData(out_buf, len);

            //счтитывание следующей порции
            readlen = in.readRawData(buffer, 256);
            qDebug() << readlen;

        }
        EVP_EncryptFinal_ex(ctx, (unsigned char*)out_buf, &len);
        qDebug() << "EVP_EncryptFinal_ex \n" << len;
        out.writeRawData(out_buf,len);
    }
    closefiles();
    qDebug() << "Encrypt finish";
}

void CryptoController::decryption(QString key)
{
    qDebug() << "Decrypt start";
    openfiles2();
    this->key = (unsigned char*) (key.toLatin1().data());
    qDebug()<< key.toLatin1();
    qDebug() << key.toLatin1().length();
    if (crypt_perm)
    {
        QDataStream in1(&f_encrypted);
        QDataStream out1(&f_decrypted);

        char buffer[256] = { 0 };
        char out_buf[256] = { 0 };

        ctx = EVP_CIPHER_CTX_new();
        EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), nullptr, this->key, iv);
        qDebug() << "EVP_DecryptInit_ex";
        int buff_len = 256;
        int len = 0;
        int readline = in1.readRawData((char *)buffer, 256);



        while(readline > 0)
        {
            //шифрование порции
            EVP_DecryptUpdate(ctx,//объект с настройками
                              (unsigned char *)out_buf,//входной параметр: ссылка, куда помещать зашифрованные данные
                              &len, //выходной параметр: длина полученного шифра
                              (unsigned char *)buffer, //входной параметр : длинна входных данных
                              readline); //выходной параметр : длина входных данных


            qDebug() << "EVP_DecryptUpdate";

            //вывод зашифрованых порций в файл
            out1.writeRawData(out_buf, len);

            //считывание следующей порции
            readline = in1.readRawData((char*)buffer, 256);
            qDebug() << readline;
        }

        EVP_DecryptFinal_ex(ctx, (unsigned char*)out_buf, &len);

        qDebug() << "EVP_DecryptFinal_ex" << len;
        out1.writeRawData(out_buf,len);

    }
    closefiles2();
    qDebug() << "Decrypt finish";
}

void CryptoController::openfiles()
{
    f_tt.setFileName("test.txt");
    f_encrypted.setFileName("encrypted.txt");

    if (f_tt.open(QIODevice::ReadOnly) & f_encrypted.open(QIODevice::WriteOnly | QIODevice::Truncate))
    {
        crypt_perm = true;
    }

}

void CryptoController::openfiles2()
{
    f_encrypted.setFileName("encrypted.txt");
    f_decrypted.setFileName("decrypted.txt");
    if (f_encrypted.open(QIODevice::ReadOnly) & f_decrypted.open(QIODevice::WriteOnly | QIODevice::Truncate))
    {
        crypt_perm = true;
    }

}

void CryptoController::closefiles()
{
    f_tt.close();
    f_encrypted.close();



}

void CryptoController::closefiles2()
{

    f_encrypted.close();
    f_decrypted.close();


}

