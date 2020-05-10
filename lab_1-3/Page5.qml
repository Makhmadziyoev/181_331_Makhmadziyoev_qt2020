import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtWebView 1.14

Page { // 5 ЛАБОРАТОРНАЯ
    id: page5
    Connections{
        target: qhttpcontroller
        function onToQML3(str1, str2){
            brow.visible = false;
            rectngl1.visible = true;
            txtarea1.visible = false;
            txtarea2.text = str1;
            text3.text = str2;
        }
    }

    Connections{
        target: qhttpcontroller
        function onToQML4(){
            brow.visible = false;
            rectngl2.visible = true;
            txtarea1.visible = false;
            buttback8.visible = false;
        }
    }

    GridLayout {
        anchors.fill: parent
        columns: 2
        RowLayout { // text area cсылка
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 3
            Layout.columnSpan: 2

            TextArea { //ссылка местонахождения
                id: txtarea1
                width: parent.width //* 0.9
                anchors.fill: parent
                font.pointSize: 10
                wrapMode: TextArea.Wrap
            }
        }

        RowLayout {}

        RowLayout { // Браузер
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 1
            Layout.columnSpan: 2
            Item{
                Layout.fillWidth: true
            }
            Rectangle {
                id: rctweb
                width: 400
                height: 500
                Layout.alignment: Qt.AlignCenter

                Rectangle{ // страница регистрации
                    id: rectnglgeneral
                    visible: true
                    width: parent.width
                    height: parent.height*0.5
                    border.width : 10
                    border.color: "#0000ff"

                    ColumnLayout {
                        Text  { //Баннер
                            id: text18
                            Layout.leftMargin: 90
                            Layout.topMargin: 20
                            font.pointSize: 18
                            text: "ПРИЛОЖЕНИЕ "
                        }
                        Image {
                            id: immail
                            sourceSize.width: 200
                            sourceSize.height: 150
                            Layout.leftMargin: 50
                            source: "mail.png"
                        }
                        Button{ // Зарегистрироваться
                            id: buttback8
                            background: Rectangle {
                                color: buttback.down ? "#0000ff":"#0000ff"
                                radius: 10
                            }
                            contentItem: Text {
                                text: buttback8.text
                                font: buttback8.font
                                color: buttback8.down ? "blue" : "white"
                            }
                            Layout.leftMargin: 150
                            Layout.topMargin: 210
                            text: "Зарегистрироваться"
                            font.pointSize: 16
                            onClicked:
                            {
                                //brow
                                //                    rectnglgeneral.visible = false;
                                brow.visible = true; //видимость браузера
                                //                    brow.url = "https://connect.mail.ru/oauth/authorize?"
                                //                            + "client_id=772344&"
                                //                            + "response_type=token&"
                                //                            + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";
                            }

                        }

                    }

                }

                Rectangle{ // ввод данных зарегистрированного пользователя
                    id: rectngl1
                    visible: false
                    width: parent.width
                    height: parent.height*0.5
                    border.width : 10
                    border.color: "#00ff00"

                    ColumnLayout {
                        Text  { //Баннер
                            id: text1
                            Layout.leftMargin: 90
                            Layout.topMargin: 20
                            font.pointSize: 18
                            text: "Доступ разрешен!"
                        }
                        Text  { // ACCESS TOKEN
                            id: textactoken
                            Layout.leftMargin: 20
                            //                            Layout.topMargin: 250
                            font.pointSize: 16
                            width: 70
                            text: "Access Token: "
                        }
                        Text  { // ВЫВОД ACCESS
                            id: text3
                            Layout.leftMargin: 30
                            //                            Layout.topMargin: 260
                            font.pointSize: 10
                            width: parent.width*0.9
                            height: 50
                            wrapMode: TextArea.Wrap
                        }
                        Button{ // Вернуться
                            id: buttback
                            background: Rectangle {
                                color: buttback.down ? "#0000ff":"#0000ff"
                                radius: 10
                            }
                            contentItem: Text {
                                text: buttback.text
                                font: buttback.font
                                color: buttback.down ? "green" : "white"
                            }
                            Layout.leftMargin: 250
                            Layout.topMargin: 150
                            text: "Вернуться"
                            font.pointSize: 16
                            onClicked:
                            {
                                buttback8.visible = false;
                                rectngl1.visible = false;
                                brow.visible = true; //видимость браузера
                                brow.url = "https://connect.mail.ru/oauth/authorize?"
                                        + "client_id=772344&"
                                        + "response_type=token&"
                                        + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";
                            }

                        }
                        Button{ // URL
                            id: butturl
                            background: Rectangle {
                                color: butturl.down ? "#0000ff":"#0000ff"
                                radius: 10
                            }
                            contentItem: Text {
                                text: butturl.text
                                font: butturl.font
                                color: butturl.down ? "green" : "white"
                            }
                            font.pointSize: 16
                            width: 30
                            text: "URL: "
                            Layout.topMargin: 0
                            Layout.rightMargin: 50
                        }
                        TextArea  { // ВЫВОД URL
                            id: txtarea2
                            font.pointSize: 10
                            width: parent.width*0.9
                            height: 70
                            wrapMode: TextArea.Wrap
                            Layout.leftMargin: 50
                            // anchors.topMargin: 15
                        }
                    }

                }

                Rectangle{ // отказ, ввод не зарегестрированного пользователя
                    id: rectngl2
                    Layout.alignment: Qt.AlignCenter
                    visible: false
                    width: parent.width
                    height: parent.height*0.5
                    border.width : 10
                    border.color: "#0000ff"
                    ColumnLayout {
                        Text { //Баннер
                            id: txterror
                            Layout.leftMargin: 90
                            Layout.topMargin: 20
                            font.pointSize: 18
                            text: "Отказано в доступе!"
                        }
                        Image { // !!!знак
                            id: znak
                            //width: 50
                            //height: 50
                            Layout.leftMargin: 150
                            Layout.topMargin: 40
                            source: "znak.png"
                        }
                        Button{ // Повторить
                            id: buttexit
                            background: Rectangle {
                                color: buttexit.down ? "#0000ff":"#0000ff"
                                radius: 10
                            }
                            contentItem: Text {
                                text: buttexit.text
                                font: buttexit.font
                                color: buttexit.down ? "green" : "white"
                            }
                            Layout.leftMargin: 250
                            Layout.topMargin: 190
                            text: "Повторить"
                            font.pointSize: 16
                            onClicked:
                            {
                                buttback8.visible = false;
                                rectnglgeneral.visible = false;
                                rectngl2.visible = false;
                                brow.visible = true; //видимость браузера
                                brow.url = "https://connect.mail.ru/oauth/authorize?"
                                        + "client_id=772344&"
                                        + "response_type=token&"
                                        + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";
                            }

                        }
                    }
                }


                WebView { // реализация окна браузера
                    id:brow
                    anchors.fill: parent
                    visible: false
                    url: "https://connect.mail.ru/oauth/authorize?client_id=772344&response_type=token&redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html"
                    onLoadingChanged: {
                        txtarea1.text = brow.url;
                        qhttpcontroller.token(brow.url);
                    }

                    Button {
                        id:goback
                        text: "X"
                        Layout.leftMargin: 150
                        Layout.topMargin: 300
                        onClicked: {
                            //brow
                            //                    rectnglgeneral.visible = false;
                            brow.visible = false; //видимость браузера
                            //                    brow.url = "https://connect.mail.ru/oauth/authorize?"
                            //                            + "client_id=772344&"
                            //                            + "response_type=token&"
                            //                            + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";
                        }
                    }
                }


            }

            Item{
                Layout.fillWidth: true
            }

        }
    }
}
