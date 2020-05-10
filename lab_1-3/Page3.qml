import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 3 ЛАБОРАТОРНАЯ
    id: page3
    header: Label {
        color: "#9020b5"
        text: qsTr("Lab3")
        padding: 10
        font.bold: true
    }
    
    GridLayout {
        anchors.fill: parent
        columns: 3
        rows: 4

        RowLayout{ // 1 Desaturate (Обесцветить)
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 0
            //Layout.columnSpan: 2

            Item{
                Layout.fillWidth: true
            }

            Item {
                width: 150
                height: 150

                Image {
                    id: bug
                    //                    horizontalAlignment: Image.AlignLeft
                    //Layout.alignment: Qt.AlignCenter
                    //                    sourceSize.width: 200
                    //                    sourceSize.height: 150
                    //                    width: 150
                    //                    height: 150
                    source: "pic_1.jpg"
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }
                Desaturate {
                    anchors.fill: bug
                    source: bug
                    desaturation: sliderDesaturation.value
                }

            }
            Item{
                Layout.fillWidth: true
            }

        }
        RowLayout{ // 1 slider 1
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 2
            Slider {
                id: sliderDesaturation
            }
            Text {
                text: "Desaturate (Обусцветить)"
            }
            Item{
                Layout.fillWidth: true
            }
        }


        RowLayout{ // 2 OpacityMask (Маска Непрозрачности)
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0

            //Layout.columnSpan: 2
            Item{
                Layout.fillWidth: true
            }
            Item {
                width:  150
                height:  150
                Image {
                    id:  bugg
                    //                   horizontalAlignment: Image.AlignLeft
                    source:  "pic_1.jpg"
                    sourceSize.width: 200
                    sourceSize.height: 150

                    //                    width: 150
                    //                    height: 150
                    //sourceSize:  Qt.size( parent.width,  parent.height)
                    smooth:  true
                    visible:  false
                }
                Image {
                    id:  mask
                    //Layout.alignment: Qt.AlignCenter
                    //source:  "pic_2.png"
                    sourceSize:  Qt.size( parent.width,  parent.height)
                    //smooth:  true
                    visible:  false
                }
                OpacityMask {
                    anchors.fill:  bugg
                    source:  bugg
                    maskSource: mask
                    invert:invertt.value
                }

            }
            Item{
                Layout.fillWidth: true
            }

        }
        RowLayout{ // 2 slider 2
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 2

            Button{
                id: button1
                text: "MaskSourse (Маска Непрозрачности)"
                onClicked: {
                    mask.source = "pic_2.png"
                    //OpacityMask.maskSource = mask
                }

            }
            CheckBox{
                id:invertt
                checked: true
                text: "Invert (инвертировать)"
            }
        }



        RowLayout{ // 3 MaskedBlur эффект размытия градиентом
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 0
            Layout.rowSpan: 3
            // Layout.columnSpan: 2
            //Layout.columnSpan: 1

            Item{
                Layout.fillWidth: true
            }

            Item {
                id: im
                width:  150
                height:  150
                Image{ // картинка
                    id: image
                    sourceSize: Qt.size(parent.width, parent.height)
                    //                sourceSize.width: 200
                    //                sourceSize.height: 150
                    //                 sourceSize:  Qt.size( parent.width,  parent.height)
                    source: "pic_1.jpg" // картинка к которой применяется эффект
                    visible: false
                }
            }


            MaskedBlur { // эффект размытия градиентом
                Layout.preferredHeight: image.height
                Layout.preferredWidth: image.width
                source: image
                
                maskSource: linearGradient
                radius:radius.position*50 // зависисимость степени размытия от позиции слайдера
                samples: samplesr.value
            }
            //Layout.alignment: Qt.AlignCenter


            LinearGradient { // линейный градиент
                id: linearGradient
                Layout.preferredHeight: image.height
                Layout.preferredWidth: image.width
                opacity: 0.0
                source: Image{
                    source: "pic_2.png" // это сама масkа которая применяется
                }
                gradient: Gradient {
                    GradientStop { position: 0.2; color: "#ffffffff" }
                    GradientStop { position: 0.5; color: "#00ffffff" }
                }
                start: Qt.point(0, 0) // эффект до середины картинки
                end: Qt.point(400, 0)
                visible: swit.value
            }
            Item{
                Layout.fillWidth: true
            }

        }
        RowLayout{ // 3 слайдер  Radius
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 2
            //Layout.columnSpan: 2
            Slider{ // слайдер
                id: radius
                from: 1.0
                to: 4.0
            }
            Text {
                text:"Radius"
            }
        }
        RowLayout{ // 3 слайдер  Samples
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 2
            //Layout.columnSpan: 2
            Slider{ // слайдер
                id: samplesr
                from: 1.0
                to: 4.0
            }

            Text {
                text:"Samples"
            }
            

            
            //                    RadioButton{
            //                    id:maskbl
            //                    }
            //                    CheckBox{
            //                    id:maskbl1
            //                    }
        }
        RowLayout {// 3 chechbox Masksource
            Layout.fillWidth: true
            Layout.row: 4
            Layout.column: 2
            CheckBox {
                id: swit
                checked: true
                text: "maskSource"
            }
        }

        //        RowLayout{ // Switch masksource
        //            Layout.fillWidth: true
        //            Layout.row: 3 //строка
        //            Layout.column: 1 // колонка
        //            Layout.columnSpan: 2

        //            //                    Slider{ // слайдер
        //            //                        id: sliderMasked

        //            //                        from: 1.0
        //            //                        to: 4.0
        //            //                    }

        //            Switch {
        //                id: swit
        //                text: "maskSource"
        //            }
        //        }
    }
}

