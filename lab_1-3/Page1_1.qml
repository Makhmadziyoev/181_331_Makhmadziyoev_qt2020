import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 1 ЛАБОРАТОРНАЯ АНЧОРС
    id: page1_1
    width: 600
    height: 400
    header: Label {
        color: "#9020b5"
        text: qsTr("MegaFon")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }
    Rectangle{
        anchors.fill: parent
        color: "#98fb98"
        
        
        Button{
            id: button2
            text: "Выберите тарифный план"
            font.family: "Arial"
            font.bold: true
            font.pixelSize: 20
            //font.italic: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                //color: ""
                color: button2.down ? "white":"white"
                radius: 10
            }
            contentItem: Text {
                
                text: button2.text
                font: button2.font
                color: button2.down ? "green" : "#9020b5"
            }
            
        }
        Dial{
            id: b
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 20
            font.italic: true
            anchors.bottom: button3.top
            anchors.horizontalCenter:button3.horizontalCenter
            //anchors.topMargin: 50
            
        }
        TextField{
            id: br
            placeholderText:  "Электронная подпись"
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            anchors.top: button3.bottom
            anchors.horizontalCenter:button3.horizontalCenter
            //anchors.left: parent.left
            // anchors.bottom:brrr.top
            //anchors.topMargin: 50
        }
        CheckBox{
            id: brr
            text: "Я соглашаюсь с условиями "
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            anchors.top:br.bottom
            anchors.horizontalCenter:button3.horizontalCenter
            //anchors.bottom: br.bottom
            
        }
        Button{
            id: button3
            text: "Настроить скорость"
            font.family: "Tahoma"
            font.bold: true
            font.pixelSize: 20
            //font.italic: true
            anchors.centerIn: parent
            background: Rectangle {
                //color: ""
                color: button3.down ? "white":"white"
                radius: 10
            }
            contentItem: Text {
                
                text: button3.text
                font: button3.font
                color: button3.down ? "green" : "#9020b5"
            }
        }
        DelayButton{
            id: brrr
            text: "Подтвердите"
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            
            anchors.bottom:parent.bottom
            anchors.horizontalCenter:button3.horizontalCenter
            
            //anchors.horizontalCenter:parent.horizontalCenter
        }
        RadioButton{
            id: rb1
            anchors.left:button2.right
            anchors.bottom: button2.top
            checked: true
            
        }
        RadioButton {
            id: rb2
            anchors.left: rb1.right
            anchors.bottom: button2.top
            checked: true
        }
        RadioButton{
            id: rb3
            anchors.right: rb1.left
            anchors.bottom: button2.top
            checked: false
            
            
        }
    }
}
