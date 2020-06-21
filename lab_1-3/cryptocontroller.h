#ifndef CRYPTOCONTROLLER_H
#define CRYPTOCONTROLLER_H


#include <QObject>
#include <QString>
#include <QFile>
# include  <C:/OpenSSL-Win64/include/openssl/conf.h >  // функции, структуры и константы настройким OpenSSL
# include  <C:/OpenSSL-Win64/include/openssl/evp.h >   // сами криптографические функции http://wiki.openssl.org/index.php/EVP
# include  <C:/OpenSSL-Win64/include/openssl/err.h >   // коды внутренних ошибок OpenSSL
# include  <C:/OpenSSL-Win64/include/openssl/aes.h >   // симметричный алгоритм блочного шифрования

#include <QtDebug>
#include <QDir>


class CryptoController : public QObject
{
    Q_OBJECT
public:
    explicit CryptoController(QObject *parent = nullptr);
    void setPath(QString);




signals:
    void test(unsigned char *nnnnn);
public slots:
    void encryption(QString key);
    void decryption(QString key);


private:
    QFile f_tt, f_encrypted, f_decrypted;
    void openfiles();
    void openfiles2();
    void closefiles();
    QString path;
    EVP_CIPHER_CTX *ctx;
    QDataStream stock(), en(), de();
    bool crypt_perm = false;




    unsigned char *key; //пароль(ключ)
    unsigned char *iv = (unsigned char *)"0123456789012345";//инициализация результата

    void closefiles2();
};

#endif // CRYPTOCONTROLLER_H






