import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page {
    id: page7
    header: Rectangle{
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#9020b5";
            }
            GradientStop {
                position: 0.23;
                color: "#9020b5";
            }
            GradientStop {
                position: 0.45;
                color: "#9020b5";
            }
            GradientStop {
                position: 0.75;
                color: "#9020b5";
            }
            GradientStop {
                position: 1.00;
                color: "#9020b5";
            }
        }
        height: 50

        Label{
            text: "Encryption"
            font.bold: true
            font.family: "Times New Roman"
            color: "#FFFFFF"
            font.pixelSize: 22
            font.italic: false
            anchors.centerIn: parent
           // anchors.center: parent.center
            //anchors.verticalCenter: parent.verticalCenter
//            anchors.margins: 75
            Layout.leftMargin: 90
            Layout.topMargin: 40
        }

        }

    GridLayout{ // GENERAL
        anchors.fill: parent
        columns: 3
        rows: 2

        TextField { // ВВОД
            id: cryptkey
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 3
            Layout.fillWidth: true
            maximumLength: 32
            font.pointSize: 15
            placeholderText:  "Enter the key"
        }

        Button{ // Encrypted
            id: buttencrypted
            Layout.row: 1
            Layout.column: 0
            //Layout.fillWidth: true
            text: qsTr("<b>Encrypted</b>")
            font.pixelSize: 25
            background: Rectangle {
                color: buttencrypted.down ? "white":"white"
                radius: 10
            }
            contentItem: Text {
                text: buttencrypted.text
                font: buttencrypted.font
                color: buttencrypted.down ? "green" : "#9020b5"
            }
            onClicked: if(cryptkey.length==32){test.encryption(cryptkey.text)}
        }

        Button{ // Decrypted
            id: buttdecrypted
            Layout.row: 1
            Layout.column: 2
            //Layout.fillWidth: true
            text: qsTr("<b>Decrypted</b>")
            font.pixelSize: 25
            background: Rectangle {
                color: buttdecrypted.down ? "white":"white"
                radius: 10
            }
            contentItem: Text {
                text: buttdecrypted.text
                font: buttdecrypted.font
                color: buttdecrypted.down ? "green" : "#9020b5"
            }
            onClicked: if(cryptkey.length==32){test.decryption(cryptkey.text)}
        }

        Text { // КОЛИЧЕСТВО ВВЕДЕНЫХ СИМВОЛОВ
            id: keylen
            text: cryptkey.length
        }
    }


}
