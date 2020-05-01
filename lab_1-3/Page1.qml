import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 1 ЛАБОРАТОРНАЯ
    //width: 600
    //height: 400
    id: page1
    header: Label {
        color: "#9020b5"
        text: qsTr("MegaFon")
        font.pixelSize: Qt.application.font.pixelSize * 3
        padding: 10
        font.bold: true
        
    }
    GridLayout {
        anchors.fill: parent
        columns: 3
        //rows: 10
        // ColumnLayout{
        
        Button{
            id: but1
            text: "Выберите тарифный план"
            Layout.row: 0
            Layout.column: 0
            font.family: "Tahoma"
            font.bold: true
            font.pixelSize: 20
            //Layout.leftMargin: 90
            //Material.foreground:   Material.Purple
            //Material.background: Material.White
            background: Rectangle {
                color: but1.down ? "white":"white"
                radius: 10
            }
            contentItem: Text {
                text: but1.text
                font: but1.font
                color: but1.down ? "green" : "#9020b5"
            }
            
        }
        //RowLayout {
        
        //Layout.fillWidth: true
        //Layout.columnSpan: 6
        RowLayout{
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 3
            Dial{
                id: dial1
                Layout.fillWidth: true
                //Layout.row: 2
                //Layout.column: 0
                font.family: "Arial"
                font.bold: false
                //font.pixelSize: 300
                Layout.maximumHeight: 300
                Layout.minimumHeight: 180
                font.italic: true
                Layout.leftMargin: 0
                //Text: "Ghb"
                value: 0.5
            }
            Button{
                //Layout.row: 2
                //Layout.column: 0
                Layout.fillWidth: true
                text: "Стандарт"
            }
            CheckBox{
                //Layout.row: 3
                //Layout.column: 0
                Layout.fillWidth: true
            }
            
            Dial {
                //Layout.row: 4
                //Layout.column: 0
                Layout.fillWidth: true
                value: 0.8
                Layout.maximumHeight: 300
                Layout.minimumHeight: 180
            }
            Button{
                text: "Универсал"
                //Layout.row: 5
                //Layout.column: 0
                Layout.fillWidth: true
            }
            CheckBox{
                //Layout.row: 6
                //Layout.column: 0
                Layout.fillWidth: true
            }
        }
        Button{
            id: but2
            text: "Настроить скорость"
            font.family: "Tahoma"
            font.bold: true
            font.pixelSize: 20
            Layout.row: 2
            Layout.column: 0
            
            background: Rectangle {
                color: button3.down ? "white":"white"
                radius: 10
            }
            
            contentItem: Text {
                text: button3.text
                font: button3.font
                color: button3.down ? "green" : "#9020b5"
            }
            
            //Layout.leftMargin: 120
        }
        TextField{
            id: tfield1
            placeholderText:  "Эл.подпись"
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            Layout.row: 3
            //anchors.left: parent.left
            //anchors.bottom:brrr.top
            //anchors.topMargin: 50
        }
        CheckBox{
            id: chbox1
            text: "Я соглашаюсь с условиями "
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            //Layout.leftMargin: 120
            Layout.row: 4
            //anchors.left:br.right
        }
        DelayButton{
            id: delbut
            text: "Подтвердите"
            font.family: "Arial"
            font.bold: false
            font.pixelSize: 15
            font.italic: true
            //Layout.leftMargin: 180
            Layout.row: 5
            Layout.column: 0
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.columnSpan: 3
            Layout.column: 0
            Layout.row: 6
            Item{
                Layout.fillWidth: true
            }
            
            RadioButton{
                id: radbut11
                checked: true
            }
            RadioButton {
                id: radbut22
                checked: true
            }
            RadioButton{
                id: radbut33
                checked: false
            }
            Button{
                id: butt2
                text: "MегаФон"
                font.family: "Tahoma"
                font.bold: true
                font.pixelSize: 30
                background: Rectangle {
                    color: butt2.down ? "white":"white"
                    radius: 10
                }
                contentItem: Text {
                    text: butt2.text
                    font: butt2.font
                    color: butt2.down ? "green" : "#9020b5"
                }
            }
            RadioButton{
                id: radbut1
                checked: true
            }
            RadioButton {
                id: radbut2
                checked: true
            }
            RadioButton{
                id: radbut3
                checked: false
            }
            Item{
                Layout.fillWidth: true
            }
        }
        //}
    }
}
