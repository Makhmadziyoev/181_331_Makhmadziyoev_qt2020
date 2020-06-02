import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 3 ЛАБОРАТОРНАЯ
    id: page3
    header:

           GridLayout{
        anchors.fill: parent
        columns: 2

        Rectangle{    // MaskedBlur

            Layout.columnSpan: 2
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
            Layout.alignment: Qt.AlignCenter

            Image {

                id: bug
                source: "elma.jpg"
                //Layout.fillHeight: true
                sourceSize: Qt.size(parent.width, parent.height)
                Layout.alignment: Qt.AlignCenter
                smooth: true
                visible: false
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
            Slider{
                Layout.alignment: Qt.AlignCenter
                Text {

                    text: qsTr("Radius")
                }
                id:sliderblurradius
                from: 0
                to: 50
                stepSize: 1


            }
            Slider{
                Layout.alignment: Qt.AlignCenter
                Text {

                    text: qsTr("Samples")
                }
                id:sliderblursamp
                from: 5
                to: 25
                stepSize: 1
            }
            Slider{
                Layout.alignment: Qt.AlignCenter
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
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            Layout.fillWidth: true

            Image {
                id: bug1
                source:  "elma.jpg"
                sourceSize: Qt.size(parent.width, parent.height)
                smooth: true
                visible: false
            }
            Desaturate {
                anchors.fill: bug1
                source: bug1
                desaturation: sliderDesaturation.value
            }


        }
        ColumnLayout{ // реализация Desaturate

            Slider{
                Text {

                    text: qsTr("Desaturate")
                }
                id:sliderDesaturation

            }
            Slider{
                Text {

                    text: qsTr("Desaturate")
                }
                id:sliderDesaturationn

            }
            Slider{
                Text {

                    text: qsTr("Desaturate")
                }
                id:sliderDesaturationnn

            }

        }


        Rectangle{    //OpacityMask

            color: "#c9cbca"
            Layout.columnSpan: 2
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


            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter


            Image {
                id:  bugg
                source:  "elma.jpg"
                sourceSize: Qt.size(parent.width, parent.height)
                smooth:  true
                visible:  false
            }
            Image {
                id:  maskk
                //smooth:  true
                visible:  false
            }
            OpacityMask {
                anchors.fill:  bugg
                source:  bugg
                maskSource: maskk
                invert:invertt.value //определяет, как будут вести себя альфа-значения исходной маски.
            }
        }
        ColumnLayout{ //реализация OpacityMask
            Button{
                id: button1
                text: "MaskSourse"
                onClicked: {
                    maskk.source = "pic_2.png"
                    //OpacityMask.maskSource = mask
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


























































































//    GridLayout {
//        anchors.fill: parent
//        columns: 3
//        rows: 4

//        RowLayout{ // 1 Desaturate (Обесцветить)
//            Layout.fillWidth: true
//            Layout.row: 0
//            Layout.column: 0
//            //Layout.columnSpan: 2

//            Item{
//                Layout.fillWidth: true
//            }

//            Item {
//                width: 150
//                height: 150
//                Button {
//                text: "tttttt"
//                }
//                Image {
//                    id: bug
//                    //                    horizontalAlignment: Image.AlignLeft
//                    //Layout.alignment: Qt.AlignCenter
//                    //                    sourceSize.width: 200
//                    //                    sourceSize.height: 150
//                    //                    width: 150
//                    //                    height: 150
//                    source: "pic_1.jpg"
//                    sourceSize: Qt.size(parent.width, parent.height)
//                    smooth: true
//                    visible: false
//                }
//                Desaturate {
//                    anchors.fill: bug
//                    source: bug
//                    desaturation: sliderDesaturation.value
//                }

//            }
//            Item{
//                Layout.fillWidth: true
//            }

//        }
//        RowLayout{ // 1 slider 1
//            Layout.fillWidth: true
//            Layout.row: 0
//            Layout.column: 2
//            Slider {
//                id: sliderDesaturation
//            }
//            Text {
//                text: "Desaturate (Обесцветить)"
//            }
//            Item{
//                Layout.fillWidth: true
//            }
//        }


//        RowLayout{ // 2 OpacityMask (Маска Непрозрачности)
//            Layout.fillWidth: true
//            Layout.row: 1
//            Layout.column: 0

//            //Layout.columnSpan: 2
//            Item{
//                Layout.fillWidth: true
//            }
//            Item {
//                width:  150
//                height:  150
//                Image {
//                    id:  bugg
//                    //                   horizontalAlignment: Image.AlignLeft
//                    source:  "pic_1.jpg"
//                    sourceSize.width: 200
//                    sourceSize.height: 150

//                    //                    width: 150
//                    //                    height: 150
//                    //sourceSize:  Qt.size( parent.width,  parent.height)
//                    smooth:  true
//                    visible:  false
//                }
//                Image {
//                    id:  mask
//                    //Layout.alignment: Qt.AlignCenter
//                    //source:  "pic_2.png"
//                    sourceSize:  Qt.size( parent.width,  parent.height)
//                    //smooth:  true
//                    visible:  false
//                }
//                OpacityMask {
//                    anchors.fill:  bugg
//                    source:  bugg
//                    maskSource: mask
//                    invert:invertt.value
//                }

//            }
//            Item{
//                Layout.fillWidth: true
//            }

//        }
//        RowLayout{ // 2 slider 2
//            Layout.fillWidth: true
//            Layout.row: 1
//            Layout.column: 2

//            Button{
//                id: button1
//                text: "MaskSourse (Маска Непрозрачности)"
//                onClicked: {
//                    mask.source = "pic_2.png"
//                    //OpacityMask.maskSource = mask
//                }

//            }
//            CheckBox{
//                id:invertt
//                checked: true
//                text: "Invert (инвертировать)"
//            }
//        }



//        RowLayout{ // 3 MaskedBlur эффект размытия градиентом
//            Layout.fillWidth: true
//            Layout.row: 2
//            Layout.column: 0
//            Layout.rowSpan: 3
//            // Layout.columnSpan: 2
//            //Layout.columnSpan: 1

//            Item{
//                Layout.fillWidth: true
//            }

//            Item {
//                id: im
//                width:  150
//                height:  150
//                Image{ // картинка
//                    id: image
//                    sourceSize: Qt.size(parent.width, parent.height)
//                    //                sourceSize.width: 200
//                    //                sourceSize.height: 150
//                    //                 sourceSize:  Qt.size( parent.width,  parent.height)
//                    source: "pic_1.jpg" // картинка к которой применяется эффект
//                    visible: false
//                }
//            }


//            MaskedBlur { // эффект размытия градиентом
//                Layout.preferredHeight: image.height
//                Layout.preferredWidth: image.width
//                source: image

//                maskSource: linearGradient
//                radius:radius.position*50 // зависисимость степени размытия от позиции слайдера
//                samples: samplesr.value
//            }
//            //Layout.alignment: Qt.AlignCenter


//            LinearGradient { // линейный градиент
//                id: linearGradient
//                Layout.preferredHeight: image.height
//                Layout.preferredWidth: image.width
//                opacity: 0.0
//                source: Image{
//                    source: "pic_2.png" // это сама масkа которая применяется
//                }
//                gradient: Gradient {
//                    GradientStop { position: 0.2; color: "#ffffffff" }
//                    GradientStop { position: 0.5; color: "#00ffffff" }
//                }
//                start: Qt.point(0, 0) // эффект до середины картинки
//                end: Qt.point(400, 0)
//                visible: swit.value
//            }
//            Item{
//                Layout.fillWidth: true
//            }

//        }
//        RowLayout{ // 3 слайдер  Radius
//            Layout.fillWidth: true
//            Layout.row: 2
//            Layout.column: 2
//            //Layout.columnSpan: 2
//            Slider{ // слайдер
//                id: radius
//                from: 1.0
//                to: 4.0
//            }
//            Text {
//                text:"Radius"
//            }
//        }
//        RowLayout{ // 3 слайдер  Samples
//            Layout.fillWidth: true
//            Layout.row: 3
//            Layout.column: 2
//            //Layout.columnSpan: 2
//            Slider{ // слайдер
//                id: samplesr
//                from: 1.0
//                to: 4.0
//            }


//            Text {
//                text:"Samples"
//            }



//            //                    RadioButton{
//            //                    id:maskbl
//            //                    }
//            //                    CheckBox{
//            //                    id:maskbl1
//            //                    }
//        }
//        RowLayout {// 3 chechbox Masksource
//            Layout.fillWidth: true
//            Layout.row: 4
//            Layout.column: 2
//            CheckBox {
//                id: swit
//                checked: true
//                text: "maskSource"
//            }
//        }

//    }
//}

