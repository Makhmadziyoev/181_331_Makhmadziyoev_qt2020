import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 3 ЛАБОРАТОРНАЯ
    id: page3

    GridLayout{
        anchors.fill: parent
        columns: 2
        rows: 6

        Rectangle{    // MaskedBlur

            Layout.columnSpan: 2
            Layout.column: 0
            Layout.row: 0
            color: "#c9cbca"

            height: 30
            Layout.fillWidth: true
            radius: 5
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                id: name
                text: qsTr("<b>MaskedBlur<b>")
            }


        }
        Item {        // картинка MaskedBlur

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row:1
            Layout.preferredWidth: 200
            //Layout.alignment: Qt.AlignCenter

            Image {

                id: bug
                source: "elma.jpg"
                anchors.fill: parent
                //Layout.fillHeight: true
                //sourceSize: Qt.size(parent.width, parent.height)
                //Layout.alignment: Qt.AlignCenter
                smooth: true
                visible: false
                fillMode: Image.PreserveAspectFit
            }

            LinearGradient {
                id: mask
                anchors.fill: bug
                gradient: Gradient {
                    GradientStop { position: 0.2; color: "#ffffffff" }
                    GradientStop { position: 0.5; color: "#00ffffff" }
                }
                start: Qt.point(0, 0)
                end: Qt.point(sliderend.value, 0)
                visible: false
            }

            MaskedBlur {
                anchors.fill: bug
                source: bug
                maskSource: mask

                radius: sliderblurradius.value
                samples: sliderblursamp.value
            }
        }
        ColumnLayout{ // реализация MaskedBlur


            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.column: 1
            Layout.row:1
            Slider{
                Text {

                    text: qsTr("Radius")
                }
                id:sliderblurradius
                from: 0
                to: 50
                stepSize: 1
                Layout.fillWidth: true

            }
            Slider{
                Layout.fillWidth: true
                Text {

                    text: qsTr("Samples")
                }
                id:sliderblursamp
                from: 5
                to: 25
                stepSize: 1
            }
            Slider{
                Layout.fillWidth: true
                Text {

                    text: qsTr("Width")
                }
                id:sliderend
                from:0
                to: 450
                stepSize: 1
            }

        }


        Rectangle{    // Desaturate

            Layout.columnSpan: 2
            Layout.column: 0
            Layout.row:2
            color: "#c9cbca"

            height: 30
            Layout.fillWidth: true
            radius: 5
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter


                text: qsTr("<b>Desaturate<b>")
            }



        }
        Item {        // картинка Desaturate
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row:3
            Layout.preferredWidth: 200

            Image {
                id: bug1
                source:  "elma.jpg"
                //sourceSize: Qt.size(parent.width, parent.height)
                smooth: true
                visible: false
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            Desaturate {
                anchors.fill: bug1
                source: bug1
                desaturation: sliderDesaturation.value
            }


        }
        ColumnLayout{ // реализация Desaturate
            Layout.column: 1
            Layout.row:3
            Layout.fillHeight: true
            Layout.fillWidth: true
            Slider{
                Layout.fillWidth: true
                Text {

                    text: qsTr("Desaturate")
                }
                id:sliderDesaturation

            }
            Slider{
                Layout.fillWidth: true
                Text {
                    anchors.fill: parent
                    text: qsTr("Desaturate")
                }
                id:sliderDesaturationn

            }
            Slider{
                Layout.fillWidth: true
                Text {
                    anchors.fill: parent
                    text: qsTr("Desaturate")
                }
                id:sliderDesaturationnn

            }

        }


        Rectangle{    //OpacityMask

            color: "#c9cbca"
            Layout.columnSpan: 2
            Layout.column: 0
            Layout.row:4
            height: 30
            Layout.fillWidth: true
            radius: 5
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter


                text: qsTr("<b>OpacityMask<b>")
            }


        }
        Item {        //картинка OpacityMask

            Layout.preferredWidth: 200
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.column: 0
            Layout.row:5
            //Layout.alignment: Qt.AlignCenter
            Image {
                id:  bugg
                source:  "elma.jpg"
                //sourceSize: Qt.size(parent.width, parent.height)
                smooth:  true
                //visible:  false
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            Image {
                id:  maskk
                //smooth:  true
                visible:  false
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
            OpacityMask {
                anchors.fill:  bugg
                source:  bugg
                maskSource: maskk
                invert:invertt.value //определяет, как будут вести себя альфа-значения исходной маски.
            }
        }
        ColumnLayout{ //реализация OpacityMask
            Layout.column: 1
            Layout.row:5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Button{
                id: button1
                text: "MaskSourse"
                onClicked: {
                    maskk.source = "pic_2.png"
                    OpacityMask.maskSource = mask
                    bugg.visible=false
                }

            }
            CheckBox{
                id:invertt
                checked: true
                text: "Invert"
            }


        }

    }

}














































//import QtQuick 2.12
//import QtQuick.Controls 2.5
//import QtQuick.Layouts 1.12
//import QtQuick.Controls.Material 2.0
//import QtGraphicalEffects 1.14
//import QtMultimedia 5.14

//Page { // 3 ЛАБОРАТОРНАЯ
//    id: page3
//    header:

//           GridLayout{
//        anchors.fill: parent
//        columns: 2


//        Rectangle{    // MaskedBlur

//            Layout.columnSpan: 2
//            color: "#c9cbca"

//            height: 30
//            Layout.fillWidth: true
//            radius: 5
//            Text {
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter

//                id: name
//                text: qsTr("<b>MaskedBlur<b>")
//            }


//        }
//        Item {        // картинка MaskedBlur
//            height: bug.height
//            width: bug.width
//            Layout.fillHeight: true
//            Layout.fillWidth: true
//            Layout.column: 0
//            Layout.row: 1
//            Layout.alignment: Qt.AlignCenter

//            Image {
//                id: bug
//                anchors.fill: parent
//                Layout.fillHeight: true
//                Layout.fillWidth: true
//                fillMode: Image.PreserveAspectFit
//                source: "elma.jpg"
//                //Layout.fillHeight: true
//                sourceSize: Qt.size(parent.width, parent.height)
//                Layout.alignment: Qt.AlignCenter
//                smooth: true
//                visible: false
//            }

//            LinearGradient {
//                id: mask
//                anchors.fill: bug
//                gradient: Gradient {
//                    GradientStop { position: 0.2; color: "#ffffffff" }
//                    GradientStop { position: 0.5; color: "#00ffffff" }
//                }
//                start: Qt.point(0, 0)
//                end: Qt.point(sliderend.value, 0)
//                visible: false
//            }

//            MaskedBlur {
//                anchors.fill: bug
//                source: bug
//                maskSource: mask

//                radius: sliderblurradius.value
//                samples: sliderblursamp.value
//            }
//        }
//        ColumnLayout{ // реализация MaskedBlur
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            Slider{
//                Layout.alignment: Qt.AlignCenter
//                Text {
//                    text: qsTr("Radius")
//                }
//                id:sliderblurradius
//                from: 0
//                to: 50
//                stepSize: 1
//            }
//            Slider{
//                Layout.alignment: Qt.AlignCenter
//                Text {
//                    text: qsTr("Samples")
//                }
//                id:sliderblursamp
//                from: 5
//                to: 25
//                stepSize: 1
//            }
//            Slider{
//                Layout.alignment: Qt.AlignCenter
//                Text {

//                    text: qsTr("Width")
//                }
//                id:sliderend
//                from:0
//                to: 450
//                stepSize: 1
//            }

//        }


//        Rectangle{    // Desaturate

//            Layout.columnSpan: 2
//            color: "#c9cbca"

//            height: 30
//            Layout.fillWidth: true
//            radius: 5
//            Text {
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter


//                text: qsTr("<b>Desaturate<b>")
//            }



//        }
//        Item {        // картинка Desaturate
//            Layout.alignment: Qt.AlignCenter
//            Layout.fillHeight: true
//            Layout.fillWidth: true
////            height: bug1.height
////            width: bug1.width

//            Image {
//                id: bug1
//                anchors.fill: parent
//                source:  "elma.jpg"
////                Layout.fillHeight: true
////                Layout.fillWidth: true
//                sourceSize: Qt.size(parent.width, parent.height)
//                smooth: true
//                visible: false
//                fillMode: Image.PreserveAspectFit
//                //fillMode: Image.PreserveAspectFit
//            }
//            Desaturate {
//                anchors.fill: bug1
//                source: bug1
//                desaturation: sliderDesaturation.value
//            }


//        }
//        ColumnLayout{ // реализация Desaturate

//            Slider{
//                Text {

//                    text: qsTr("Desaturate")
//                }
//                id:sliderDesaturation

//            }
//            Slider{
//                Text {

//                    text: qsTr("Desaturate")
//                }
//                id:sliderDesaturationn

//            }
//            Slider{
//                Text {

//                    text: qsTr("Desaturate")
//                }
//                id:sliderDesaturationnn

//            }

//        }


//        Rectangle{    //OpacityMask

//            color: "#c9cbca"
//            Layout.columnSpan: 2
//            height: 30
//            Layout.fillWidth: true
//            radius: 5
//            Text {
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter


//                text: qsTr("<b>OpacityMask<b>")
//            }


//        }
//        Item {        //картинка OpacityMask


//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            Layout.alignment: Qt.AlignCenter


//            Image {
//                id:  bugg
//                source:  "elma.jpg"
//                sourceSize: Qt.size(parent.width, parent.height)
//                smooth:  true
//                visible:  false
//                anchors.fill: parent
//                fillMode: Image.PreserveAspectFit
//            }
//            Image {
//                id:  maskk
//                //smooth:  true
//                visible:  false
//                fillMode: Image.PreserveAspectFit
//            }
//            OpacityMask {
//                anchors.fill:  bugg
//                source:  bugg
//                maskSource: maskk
//                invert:invertt.value //определяет, как будут вести себя альфа-значения исходной маски.
//            }
//        }
//        ColumnLayout{ //реализация OpacityMask
//            Button{
//                id: button1
//                text: "MaskSourse"
//                onClicked: {
//                    maskk.source = "pic_2.png"
//                    //OpacityMask.maskSource = mask
//                }

//            }
//            CheckBox{
//                id:invertt
//                checked: true
//                text: "Invert"
//            }


//        }

//    }




    

//}




