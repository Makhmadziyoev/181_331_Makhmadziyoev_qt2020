import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtWebView 1.14

Page { // 5 ЛАБОРАТОРНАЯ
    id: page5
    header:
        ToolBar{
        anchors.top: parent.top
        background: Rectangle{
            implicitHeight: 50
            width: parent.width

            Text {
                id: txt4
                anchors.verticalCenter: parent.verticalCenter
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.right: txt44.left
                font.pointSize: 35
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ff8c00"
                text: "@"
            }
            Text {
                id: txt44
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 25
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ffffff"
                text: "mail"
            }

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#1e90ff" }
                GradientStop { position: 0.25; color: "#1e90ff" }
                GradientStop { position: 0.5; color: "#1e90ff" }
                GradientStop { position: 0.75; color: "#1e90ff" }
                GradientStop { position: 1.0; color: "#1e90ff" }
            }
        }
    }


    Connections{ //1
        target: qhttpcontroller
        function onToQML3(str1, str2){
            brow.visible = false;
            rectngl1.visible = true;
            txtarea1.visible = false;
            txtarea2.text = str1;
            text3.text = str2;
            //buttback8.visible = false;

        }
    }

    Connections{ //2
        target: qhttpcontroller
        function onToQML4(){
            brow.visible = false;
            rectngl2.visible = true;
            txtarea1.visible = false;
            //buttback8.visible = false;
        }
    }

    TextArea { //ссылка местонахождения
        id: txtarea1
        height: parent.height* 0.2
        width: parent.width * 0.9
        font.pointSize: 10
        anchors.margins: 15
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        wrapMode: TextArea.Wrap

    }


    Rectangle{ //1 страница регистрации
        id: rectnglgeneral
        visible: if(rectngl1.visible == true){rectnglgeneral.visible = false}
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: txtarea1.top
        color: "#fff"
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50

        Text  {     // Баннер
            id: text18
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            text: "Регистрация"
        }
        TextField { // Логин
            id: email
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text18.bottom
            anchors.horizontalCenter:text18.horizontalCenter
            font.pointSize: 15
            placeholderText:  "E@mail"
            color: "#0000ff"
        }
        TextField { // Пароль
            id: password
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: email.bottom
            anchors.horizontalCenter:email.horizontalCenter
            font.pointSize: 15
            placeholderText:  "Password"
        }
        RoundButton{
            id:exit
            anchors.top: password.bottom
            anchors.left: password.left
            text: "Войти"
            background: Rectangle {
                color: exit.down ? "#0000ff":"#0000ff"
                radius: 10
            }
            contentItem: Text {
                text: exit.text
                font: exit.font
                color: exit.down ? "green" : "white"
            }
        }
        RoundButton{
            id: reg
            anchors.top: password.bottom
            anchors.right: password.right
            text: "Зарегистрироваться"
            background: Rectangle {
                color: reg.down ? "#0000ff":"#0000ff"
                radius: 10
            }
            contentItem: Text {
                text: reg.text
                font: reg.font
                color: reg.down ? "green" : "white"
            }

        }
        RoundButton{
            id:mailbut
            anchors.top: reg.bottom
            anchors.horizontalCenter:reg.horizontalCenter
            icon.width: 80
            icon.height: 60
            icon.source: "qrc:mail.png"
            onClicked:
            {

                brow.visible = true; //видимость браузера

            }
        }

    }


    Rectangle{ //2 ввод данных зарегистрированного пользователя
        id: rectngl1
        visible: false
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: txtarea1.top
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        border.color: "#00ff00"

        Text  { //Баннер
            id: text1
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            text: "Доступ разрешен!"
        }


        Text  { // ACCESS TOKEN
            id: textactoken
            anchors.bottom: text3.top
            anchors.horizontalCenter:parent.horizontalCenter
            font.pointSize: 16
            //width: 70
            text: "Access Token: "
            color: "blue"
        }
        Text  { // ВЫВОД ACCESS
            id: text3
            anchors.bottom: mailButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
            //width: parent.width*0.9
            //height: 50
            wrapMode: TextArea.Wrap
        }
        Button{ // Показать данные
            id:mailButton
            anchors.centerIn: parent
            background: Rectangle {
                color: mailButton.down ? "#0000ff":"#0000ff"
                radius: 10
            }
            contentItem: Text {
                text: mailButton.text
                font: mailButton.font
                color: mailButton.down ? "green" : "white"
            }
            text: "Показать Данные"
            onClicked:{
                restRequest();
                db_write();
                db_read();
            }
        }
        Button{ // URL
            id: butturl
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: mailButton.bottom
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
            //width: 30
            text: "URL:"

        }
        TextArea  { // ВЫВОД URL
            id: txtarea2
            //anchors.left: butturl.right
            anchors.bottom: parent.bottom
            font.pointSize: 10
            width: parent.width*0.9
            //height: 70
            wrapMode: TextArea.Wrap

        }



        //                    ColumnLayout {



        //                        Button{ // Вернуться
        //                            id: buttback
        //                            background: Rectangle {
        //                                color: buttback.down ? "#0000ff":"#0000ff"
        //                                radius: 10
        //                            }
        //                            contentItem: Text {
        //                                text: buttback.text
        //                                font: buttback.font
        //                                color: buttback.down ? "green" : "white"
        //                            }
        //                            Layout.leftMargin: 250
        //                            Layout.topMargin: 150
        //                            text: "Вернуться"
        //                            font.pointSize: 16
        //                            onClicked:
        //                            {
        //                                buttback8.visible = false;
        //                                rectngl1.visible = false;
        //                                brow.visible = true; //видимость браузера
        //                                brow.url = "https://connect.mail.ru/oauth/authorize?"
        //                                        + "client_id=772344&"
        //                                        + "response_type=token&"
        //                                        + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";
        //                            }

        //                        }

        //                        }



        //                    }



    }


    Rectangle{ //3 отказ, ввод не зарегестрированного пользователя
        id: rectngl2
        visible: false
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: txtarea1.top
        border.color: "#1e90ff"
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        Text { //Баннер
            id: txterror
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            text: "Отказано в доступе!"
        }

        Image { // !!!знак
            id: znak
            //                        anchors.top: parent.top
            //                        anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
            source: "znak.png"
        }

        Button{ // Повторить
            id: buttexit
            anchors.top: znak.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                color: buttexit.down ? "#1e90ff":"#1e90ff"
                radius: 10
            }
            contentItem: Text {
                text: buttexit.text
                font: buttexit.font
                color: buttexit.down ? "green" : "white"
            }

            text: "Повторить"
            font.pointSize: 16
            onClicked:
            {
                //buttback8.visible = false;
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


    WebView { // реализация окна браузера
        id:brow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: txtarea1.top
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
        width: parent.width
        height: parent.height*0.7
        visible: false
        url: "https://connect.mail.ru/oauth/authorize?client_id=772344&response_type=token&scope=messages&redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html"
        onLoadingChanged: {
            txtarea1.text = brow.url;
            qhttpcontroller.success(brow.url);
            qhttpcontroller.hashMD5(brow.url)
        }

        Button {
            id:goback
            text: "❌ "
            //visible: if(brow.visible == true)//{rectnglgeneral.visible = false}
            anchors.leftMargin: 90
            onClicked: {
                brow.visible = false; //видимость браузера

            }

        }


    }







}
