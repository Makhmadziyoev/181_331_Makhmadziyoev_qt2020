import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

ApplicationWindow {
    signal makeRequest()
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            id: page1
        }
        Page1_1 {
            id: page1_1
        }
        Page2 {
            id: page2
        }
        Page3 {
            id: page3
        }
        Page4 {
            id: page4
        }
        Page5 {
            id: page5
        }
        Page6 {
            id: page6
        }


    }
    Drawer{
        id: dr1
        width: parent.width * 0.67
        height: parent.height
        dragMargin: 20
        ColumnLayout{
            anchors.fill: parent
            Button{ // 1 lab
                text: "Lab 1"
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 0;
                    dr1.close();
                }
            }
            Button{ // 1.2 lab
                text: "Lab 1.2"
                Layout.row: 1
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 1;
                    dr1.close();
                }
            }
            Button{ // 2 lab
                text: "Lab 2"
                Layout.row: 2
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 2;
                    dr1.close();
                }
            }
            Button{ // 3 lab
                text: "Lab 3"
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 3;
                    dr1.close();
                }
            }
            Button{ // 4 lab
                text: "Lab 4"
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 4;
                    dr1.close();
                }
            }
            Button{ // 5 lab
                text: "Lab 5"
                Layout.row: 5
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 5;
                    dr1.close();
                }
            }
            Button{ // 6 lab
                text: "Lab 6"
                Layout.row: 5
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle{
                    color: "#9020b5"
                }
                onClicked: {
                    swipeView.currentIndex = 6;
                    dr1.close();
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


        //        TabButton {
        //            text: qsTr("Lab 1")
        //        }
        //        TabButton {
        //            id: dr
        //            text: qsTr("Lab1.1")
        //            font.bold: false
        //            font.pixelSize: 15
        //            background: Rectangle {
        //                //color: ""
        //                color: dr.down ? "white":"white"
        //            }
        //            contentItem: Text {

        //                text: dr.text
        //                font: dr.font
        //                color: dr.down ? "green" : "#9020b5"
        //            }
        //            Rectangle{
        //                anchors.fill: parent
        //                color: "#98fb98"

        //            }
        //        }

        //        TabButton {
        //            text: qsTr("Lab 2")
        //        }

        //        TabButton {
        //            text: qsTr("Lab 3") }
        //        TabButton {
        //            text: qsTr("Lab 4") }
    }


}
