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
        RowLayout{ // Desaturate эффект черно-белого
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 2
            Item {
                width: 200
                height: 150
                Image {
                    id: bug
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
            Slider {
                id: sliderDesaturation
            }
            Text {
                text: "Desaturate"
            }
        }
        RowLayout{ // OpacityMask Маска
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 0
            Layout.columnSpan: 2
            Item {
                width:  200
                height:  150
                Image {
                    id:  bugg
                    source:  "pic_1.jpg"
                    sourceSize:  Qt.size( parent.width,  parent.height)
                    smooth:  true
                    visible:  false
                }
                Image {
                    id:  mask
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
            Button{
                id: button1
                text: "MaskSourse"
                onClicked: {
                    mask.source = "pic_2.png"
                    //OpacityMask.maskSource = mask
                }
                
            }
            CheckBox{
                id:invertt
                checked: true
                text: "Invert"
            }
            
        }
        
        RowLayout{ // MaskedBlur эффект размытия градиентом
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 0
            Layout.columnSpan: 2
            Image{ // картинка
                id: image
                sourceSize.width: 200
                sourceSize.height: 150
                source: "pic_1.jpg" // картинка к которой применяется эффект
                visible: false
            }
            
            MaskedBlur { // эффект размытия градиентом
                Layout.preferredHeight: image.height
                Layout.preferredWidth: image.width
                source: image
                
                maskSource: linearGradient
                radius:radius.position*50 // зависисимость степени размытия от позиции слайдера
                samples: samplesr.value
                
                Layout.alignment: Qt.AlignCenter
            }
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
        }
        RowLayout{ // слайдер
            Layout.fillWidth: true
            Layout.row: 5
            Layout.column: 1
            Layout.columnSpan: 2
            
            //                    Slider{ // слайдер
            //                        id: sliderMasked
            
            //                        from: 1.0
            //                        to: 4.0
            //                    }
            
            Switch {
                id: swit
                text: "maskSource"
            }
        }
        RowLayout{ // слайдер
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 1
            Layout.columnSpan: 2
            Slider{ // слайдер
                id: radius
                from: 1.0
                to: 4.0
            }
            Text {
                text:"Radius"
            }
        }
        RowLayout{ // слайдер
            Layout.fillWidth: true
            Layout.row: 4
            Layout.column: 1
            Layout.columnSpan: 2
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
    }
}
