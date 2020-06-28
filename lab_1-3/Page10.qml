import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14
import QtWebSockets 1.5
import QtQuick.Window 2.2
//import QtCharts 2.3



Page{
    id: page10

    header: ToolBar{
        anchors.top: parent.top
        background: Rectangle{
            implicitHeight: 50
            width: parent.width

            Text {
                id: txt47
                anchors.verticalCenter: parent.verticalCenter
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.right: txt447.left
                font.pointSize: 35
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ff8c00"
                text: "10"
            }
            Text {
                id: txt447
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 25
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ffffff"
                text: "lab"
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

    Image{
        source: "background.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    ColumnLayout{
        anchors.fill: parent

        ListView{
            id: lstMessage
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 10 //|| brd_img.contentHeight + 30 + 20 + 15 + 20
            verticalLayoutDirection: ListView.BottomToTop //смена


            delegate: Item {
                width: lstMessage.width
                height: brd_img.height
                //Layout.topMargin: 50


                BorderImage {
                    id: brd_img
                    border {left: 57; top: 45; right: 57; bottom: 45}
                    width: parent.width * 2/3
                    height: txtMessage.contentHeight  + 30 + 20 + 15 + 20 //+ txtDate.contentHeight
                    source: model_outmessage?"qrc:/out_ballon.png":"qrc:/in_ballon.png"
                    anchors.left: model_outmessage?undefined:parent.left  //parent.left:undefined
                    anchors.right: model_outmessage?parent.right:undefined //undefined:parent.right


                    ColumnLayout{
                        anchors.fill: parent
                        // anchors.margins: 45
                        anchors.topMargin: 20
                        anchors.bottomMargin: 15
                        anchors.leftMargin: 40
                        anchors.rightMargin: 40
                        TextEdit{ // текст сообщения
                            id: txtMessage
                            text: model_text
                            font.pixelSize: 2.5 * Screen.pixelDensity
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            readOnly: true
                        }
                        TextEdit{
                            id: txtDate
                            text: model_date
                            font.italic: true
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            horizontalAlignment: Qt.AlignRight
                            wrapMode: Text.WordWrap
                            readOnly: true
                        }
                    }

                }
            }

            model: ListModel{
                id: model_messages
                ListElement{
                    model_outmessage: false
                    model_text: "Тестовое входящее сообщение 1"
                    model_date: "10:00 11 июн 2020"
                }
                ListElement{
                    model_outmessage: false
                    model_text: "Тестовое входящее сообщение 2"
                    model_date: "10:01 11 июн 2020"
                }

            }

        }

        Rectangle{
            id:rectaParent
            Layout.fillWidth: true
            Layout.preferredHeight: rect10.height

            RowLayout{
                id: row_lay
                Layout.preferredHeight: 50
                Layout.fillWidth: true
                anchors.bottom: parent.bottom

                Rectangle{
                    anchors.bottom: parent.bottom
                    id:rect10
                    Layout.preferredHeight: textMessageToSend.contentHeight + 25
                    Layout.preferredWidth: rectaParent.width - batton.width - 10
                    color: "white"
                    radius: 3
                    TextArea{
                        id: textMessageToSend
                        anchors.fill: parent
                        anchors.leftMargin: 5
                        //Layout.fillHeight: true
                        font.pixelSize: 2.5 * Screen.pixelDensity
                        focus: true
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        placeholderText: "Message"
                        height: 60
                    }
                }


                Button{
                    id: batton
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 40
                    Layout.rightMargin: 5
                    Material.background: Material.Cyan
                    icon.source: "qrc:/send.png"
                    //                Material.foreground: Material.Indigo
                    onClicked: {
                        model_messages.insert(0,{"model_outmessage" : true,
                                                  "model_text": textMessageToSend.text,
                                                  "model_date": new Date().toLocaleString(Qt.locale("ru_RU"))
                                              });

                        ws.sendTextMessage(textMessageToSend.text);
                        textMessageToSend.clear();
                    }
                }

            }

        }//rect

    }

    WebSocket {
        id: ws
        active: true
        url: "ws://localhost:8765"
        onTextMessageReceived:{
            console.log("***message : ", message);
            model_messages.insert(0,{"model_outmessage": false,
                                      "model_text": message,
                                      "model_date": new Date().toLocaleString(Qt.locale("ru_RU"))
                                  });

        }

        onStatusChanged: {
            switch(status)
            {
            case WebSocket.Connecting:
                console.log("***status : Connecting");
                break;
            case WebSocket.Open:
                console.log("***status : Open ");
                break;
            case WebSocket.Closing:
                console.log("***status : Closing");
                break;
            case WebSocket.Close:
                console.log("***status : Close");
                break;
            case WebSocket.Error:
                console.log("***status : Error");
                console.log("***ErrorString = ", errorString);
                break;
            }
        }
    }
}




















































































//Page {
//    id: page10
//    header:
//        ToolBar{
//        anchors.top: parent.top
//        background: Rectangle{
//            implicitHeight: 50
//            width: parent.width

//            Text {
//                id: txt47
//                anchors.verticalCenter: parent.verticalCenter
//                //anchors.horizontalCenter: parent.horizontalCenter
//                anchors.right: txt447.left
//                font.pointSize: 35
//                font.family: "Dupe"
//                //font.italic: true
//                font.bold: true
//                color: "#ff8c00"
//                text: "10"
//            }
//            Text {
//                id: txt447
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.horizontalCenter: parent.horizontalCenter
//                font.pointSize: 25
//                font.family: "Dupe"
//                //font.italic: true
//                font.bold: true
//                color: "#ffffff"
//                text: "lab"
//            }

//            gradient: Gradient {
//                GradientStop { position: 0.0; color: "#1e90ff" }
//                GradientStop { position: 0.25; color: "#1e90ff" }
//                GradientStop { position: 0.5; color: "#1e90ff" }
//                GradientStop { position: 0.75; color: "#1e90ff" }
//                GradientStop { position: 1.0; color: "#1e90ff" }
//            }
//        }
//    }

//}






















































//    ColumnLayout{
//    anchors.fill: parent

//    ListView{//лента сообщений
//        id:lstMessages
//        Layout.fillHeight: true
//        Layout.fillWidth: true

//        delegate: Item { //фон сообщения
//            width: lstMessages.width
//            height: 100 //высота поля сообщения в зависимости от текста

//            BorderImage { //фон сообщения
//                id: name

//                width: parent.width *2/3
//                height: 100
//                source: modeldirection?"znak.png":"znak.png"
//                anchors.left: modeldirection?parent.left:underfined
//                anchors.right: modeldirection?underfined:parent.right
//                border.left: 57; border.top: 45
//                border.right: 57; border.bottom: 55
//            }

//            TextArea{//текст сообщения
//                id: txtMessage
//                text: modeltext

//            }
//            Text {
//            text: modeldatetime
//            }
//        }

//    }
//    }

