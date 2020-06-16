import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page {
    id: page10
    header:
        ToolBar{
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





    ColumnLayout{
    anchors.fill: parent

    ListView{//лента сообщений
        id:lstMessages
        Layout.fillHeight: true
        Layout.fillWidth: true

        delegate: Item { //фон сообщения
            width: lstMessages.width
            height: 100 //высота поля сообщения в зависимости от текста

            BorderImage { //фон сообщения
                id: name

                width: parent.width *2/3
                height: 100
                source: modeldirection?"znak.png":"znak.png"
                anchors.left: modeldirection?parent.left:underfined
                anchors.right: modeldirection?underfined:parent.right
                border.left: 57; border.top: 45
                border.right: 57; border.bottom: 55
            }

            TextArea{//текст сообщения
                id: txtMessage
                text: modeltext

            }
            Text {
            text: modeldatetime
            }
        }

    }
    }
}
