import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2 // подсказка конт пробел
import QtMultimedia 5.4
import QtWinExtras 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.12
import QtWebView 1.1

Page{
    id:page6
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
                text: "@"
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

    ColumnLayout{ // general
        anchors.fill: parent
        Layout.alignment: Qt.AlignHCenter

    RowLayout{ // radio buttons
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

        RadioButton{ // вывод отображения данных
            id: rad_1 // id
            //Layout.alignment: Qt.AlignLeft
            text: "Столбцы" // подпись
            checked: true // выбран по умолчанию
            contentItem: Text {
                    text: rad_1.text
                    font.bold: true
                    color: "#1e90ff"
                    font.pointSize: 18
                    font.family: "Dupe"
                    leftPadding: rad_1.indicator.width + rad_1.spacing
                    //verticalAlignment: Text.AlignVCenter
                }
            Material.accent: "#1e90ff" // Material.Teal
            onCheckedChanged: // если сменен выбор
                if(rad_1.checked === true){ // если выбран rad1
                    grid.visible = true
                    list.visible = false
                }
        }

        RadioButton{ // вывод отображения данных
            id: rad_2 // id
            //Layout.alignment: Qt.AlignRight
            text: "Строки" // подпись
            checked: false
            Material.accent: "#1e90ff"
            contentItem: Text {
                    text: rad_2.text
                    font.bold: true
                    color: "#1e90ff"
                    font.pointSize: 18
                    font.family: "Dupe"
                    leftPadding: rad_2.indicator.width + rad_2.spacing
                    //verticalAlignment: Text.AlignVCenter
                }
            onCheckedChanged: // если вменен выбор
                if(rad_2.checked === true){ // если выбран rad2
                    list.visible = true // видео не отображается
                    grid.visible = false // слайдер не отображается
                }
        }
    }


        GridView{ //Вывод в столбцы
            id: grid
            visible: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            enabled: true
            cellHeight: 150
            cellWidth: 300
            model: mail_model

            //spacing: 10

            delegate: Rectangle{
                color: "white"
                width: 300
                height: 150
                border.color: "#1e90ff"
                Layout.margins: 10
                GridLayout{ // ВЫВОД В СТОЛБИК
                    anchors.fill: parent
                    columns: 3
                    rows: 3
                    //Layout.margins: 20
                    Image{
                        source: pic50x50
                        Layout.column: 0
                        Layout.row: 0
                        Layout.rowSpan: 3
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        Layout.margins: 5
                        fillMode: Image.PreserveAspectFit
                    }
                    Label{ //name
                        color: "black"
                        text: "Имя: " + user_id
                        Layout.column: 1
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Label{ // second name
                        color: "black"
                        text: "Описание: " + textt
                        wrapMode: Label.Wrap
                        Layout.column: 1
                        Layout.row: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Label{ // Age
                        id: lbl23
                        color: "black"
                        text: //"Приватность: " + comments_count
                              if (comments_count == 1) {lbl23.text = "ПРИВАТНО"}else{lbl23.text = "ОБЩЕДОСТУПНО"}

                        Layout.column: 1
                        Layout.row: 3
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                }
            }
        }

        ListView{ //Вывод в строку
            id: list
            visible: false
            Layout.fillHeight: true
            Layout.fillWidth: true
            enabled: true
            model: mail_model
            spacing: 30

            delegate: Rectangle{
                color: "white"
                width: 600
                height: 100
                border.color: "#1e90ff"
                Layout.margins: 10
                GridLayout{
                    anchors.fill: parent
                    columns: 4
                    rows: 4
                    //Layout.margins: 20
                    Image{ // photo
                        source: pic50x50
                        Layout.column: 0
                        Layout.row: 0
                        Layout.rowSpan: 3
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        Layout.margins: 5
                        fillMode: Image.PreserveAspectFit
                    }
                    Label{ // name
                        color: "black"
                        text:"Имя: " + user_id
                        Layout.column: 1
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Label{ //
                        color: "black"
                        text:"Описание: " + textt
                        Layout.column: 1
                        Layout.row: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Item {
                        Layout.column: 3
                        Layout.row: 1
                        Layout.fillWidth: true}
                    Label{ //
                        id: lbl22
                        color: "black"
                        text: if (comments_count == 1) {lbl22.text = "ПРИВАТНО"}else{lbl22.text = "ОБЩЕДОСТУПНО"} //"Статус: " + comments_count
                        Layout.column: 2
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        Layout.leftMargin: 25

                    }
                }
            }
        }
    }



}
