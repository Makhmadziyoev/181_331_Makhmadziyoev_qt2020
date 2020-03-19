import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            //width: 600
            //height: 400
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
        Page {
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
        Page {
            header: Label {
                color: "#9020b5"
                text: qsTr("Lab3")
                padding: 10
                font.bold: true
            }
            GridLayout {
                //anchors.fill: parent
                columns: 3 //колонка
                //rows: 10 //строчка

                Image {
                    id: image1
                    width: 50; height: 50
                    source: "pic_1.jpg"
                    Layout.row: 0
                    Layout.column: 0
                }
                LinearGradient{
                id: mask
                anchors.fill: image1
                gradient: Gradient {
                    GradientStop { position: 0.3; color: "#ffffffff" }
                    GradientStop { position: 0.5; color: "#00ffffff" }
                }
                start: Qt.point(0, 0)
                          end: Qt.point(300, 0)
                          visible: false
                }
                MaskedBlur {
                anchors.fill: image1 //eссылка на картинку
                source: image1
                maskSource: mask
                radius: 16
                samples: 24
                }
//                Slider{
//                    Layout.row: 2
//                    Layout.column: 1
//}
//                Image {
//                id: image2
//                width: 100
//                height: 100
//                source: "pic_1.png"
//                Layout.row: 1
//                Layout.column: 0
//            }
//                Image {
//                id: image3
//                width: 200
//                height: 200
//                source: "pic_1.png"
//                Layout.row: 2
//                Layout.column: 0
//            }
            }
            //Tumbler{
               //Layout.row: 2
               // Layout.column: 1
            //}
           // SpinBox{
               // Layout.row: 3
               // Layout.column: 2
           // }

        }
        Page {
            GridLayout {
                //anchors.fill: parent
                columns: 3
                Button{
                id: buttt
                }
                Button{
                id: butttt
                }

            }
            TextField{
            }


        }
    }


    Drawer {
        //anchors.fill:parent
        width:0.66 * parent.width
        height: parent.height
        GridLayout {
            anchors.fill: parent
            columns: 1
            Button{

            }
            Button{}
            Button{}
            Switch {
                onScaleChanged: {
                    text = "green";
                }
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


        TabButton {
            text: qsTr("Lab 1")
        }
        TabButton {
            id: dr
            text: qsTr("Lab1.1")
            font.bold: false
            font.pixelSize: 15
            background: Rectangle {
                //color: ""
                color: dr.down ? "white":"white"
            }
            contentItem: Text {

                text: dr.text
                font: dr.font
                color: dr.down ? "green" : "#9020b5"
            }
            Rectangle{
                anchors.fill: parent
                color: "#98fb98"

            }
        }

        TabButton {
            text: qsTr("Lab 3") }
        TabButton {
            text: qsTr("Lab 4") }
    }
}
