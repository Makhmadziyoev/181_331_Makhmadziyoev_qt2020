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
                border.color: "pink"
                Layout.margins: 10
                GridLayout{
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
                        text: "Фамилия: " + textt
                        Layout.column: 1
                        Layout.row: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Label{ // Age
                        color: "black"
                        text: "Возраст: " + comments_count
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
                border.color: "pink"
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
                    Label{ // last name
                        color: "black"
                        text:"Фамилия: " + textt
                        Layout.column: 2
                        Layout.row: 1
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                    Item {
                        Layout.column: 3
                        Layout.row: 1
                        Layout.fillWidth: true}
                    Label{ // Age
                        color: "black"
                        text: "Возраст: " + comments_count
                        Layout.column: 1
                        Layout.row: 2
                        Layout.fillHeight: true
                        Layout.preferredWidth: 100
                        //Layout.margins: 20
                    }
                }
            }
        }
    }



}
