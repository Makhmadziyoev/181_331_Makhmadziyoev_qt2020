import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page { // 1 ЛАБОРАТОРНАЯ
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
        Page { // 1 ЛАБОРАТОРНАЯ АНЧОРС
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
        Page { // 2 ЛАБОРАТОРНАЯ
            header: Label {
                GridLayout{
                    anchors.fill: parent
                    columns: 3
                    RowLayout{
                        Layout.fillWidth: true
                        Layout.column: 2
                        Layout.row: 0
                        Layout.columnSpan: 3

                        Item{
                            Layout.fillWidth: true
                        }
                        RadioButton{
                            id: radiobut
                            text: "Видео"
                        }

                        RadioButton{
                            id: radiobut2
                            text: "Camera"
                        }
                        Item{
                            Layout.fillWidth: true
                        }
                    }
                }


            }

            GridLayout{
                anchors.fill: parent
                columns: 3


                RowLayout{
                    visible: {if(radiobut.checked){true}else{false}}
                    Layout.fillWidth: true
                    //Layout.columnSpan: 4
                    Layout.column: 2
                    Layout.row: 3

                    MediaPlayer {             // МЕДИАПЛЕЕР
                        id: player
                        source: "War.mp4"
                        volume: vol.value
                        onPositionChanged: {
                        timeline.sync = true
                        timeline.value = player.position
                        timeline.sync = false
                        }

                    }
                    VideoOutput {
                        id: vid
                        source: player
                    }


                }

                RowLayout{                                       //Таймлайн видео
                    visible: {if(radiobut.checked){true}else{false}}
                    Layout.fillWidth: true
                    //Layout.columnSpan: 1
                    Layout.column: 2
                    Layout.row: 4
                    Slider{                                     // таймлапс слайдер
                        id: prosmotr
                        to: player.duration
                        property bool sync: false
                        onValueChanged: {if(!sync){player.seek(value)}}
                        Layout.fillWidth: true
                    }
                }
                RowLayout{
                    visible: {if(radiobut.checked){true}else{false}}

                    Layout.fillWidth: true
                    //Layout.columnSpan: 1
                    Layout.column: 2
                    Layout.row: 5
                    Item{
                        Layout.fillWidth: true
                    }
                    Button{
                        id: ut1
                        text: "play"
                        onClicked: player.playbackState === MediaPlayer.PlayingState ?
                        player.pause() : player.play()
                        //onClicked: {if(player.play()){true} else {false} (player.pause())  }
                        //onClicked: player.playing()
                    }
                    Text {
                    text: "Громкость"
                    }
                    Slider {
                        id: vol
                        from: 0
                        value: 0.5
                        to:1
                    }

                    Item{
                        Layout.fillWidth: true
                    }
                }

            }



            GridLayout { //Camera
                anchors.fill: parent
                columns: 3
                RowLayout { //Camera
                    Layout.fillWidth: true
                    //Layout.columnSpan: 4
                    Layout.column: 2
                    Layout.row: 2
                    visible: {if(radiobut2.checked){true}else{false}}
                    Item{
                        Layout.fillWidth: true
                    }
                    Item{
                        width: 440
                        height: 360

                        Camera {
                            id: camera



                            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                            exposure {
                                exposureCompensation: -1.0
                                exposureMode: Camera.ExposurePortrait
                            }

                            flash.mode: Camera.FlashRedEyeReduction

                            imageCapture {
                                onImageCaptured: {
                                    savedphoto.source = preview  // Show the preview in an Image
                                }
                            }

                        }

                        VideoOutput {
                            source: camera
                            anchors.fill: parent
                            focus : visible // to receive focus and capture key events when visible
                        }

                        Image {
                            id: photoPreview
                        }
                    }
                    Item{
                        Layout.fillWidth: true
                    }

                }
                RowLayout{
                    Layout.fillWidth: true
                    //Layout.columnSpan: 4
                    Layout.column: 2
                    Layout.row: 3
                    visible: {if(radiobut2.checked){true}else{false}}
                Button{
                id: photo
                text: "Photo"
                 onClicked: camera.imageCapture.captureToLocation("F:/git_qt/181_331_Makhmadziyoev_qt2020/lab_1-3/photo")
                }
                Button{
                id: video
                text: "video"
                }

                Item{
                    Layout.fillWidth: true
                }
                Item {
                width: 100
                height: 60
                Image {
                    id: savedphoto
                    anchors.fill: parent
                }
                }
                }
            }






        }
        Page { // 3 ЛАБОРАТОРНАЯ
            header: Label {
                color: "#9020b5"
                text: qsTr("Lab3")
                padding: 10
                font.bold: true
            }

            GridLayout {
                RowLayout{
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

                }

                RowLayout{
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

                        }

                    }
                    Button{
                        id: button1
                        text: "Маска"
                        onClicked: {
                            mask.source = "pic_2.png"
                            //OpacityMask.maskSource = mask
                        }

                    }

                }

                RowLayout{
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
                        radius: sliderMasked.position*50 // зависисимость степени размытия от позиции слайдера
                        samples: 25
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
                        //visible: false
                    }


                }

                RowLayout{
                    Layout.fillWidth: true
                    Layout.row: 3
                    Layout.column: 1
                    Layout.columnSpan: 2
                    Slider{ // слайдер
                        id: sliderMasked
                        from: 1.0
                        to: 4.0
                    }


                }
            }


        }
        Page { // 4 ЛАБОРАТОРНАЯ



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
            text: qsTr("Lab 2")
        }

        TabButton {
            text: qsTr("Lab 3") }
        TabButton {
            text: qsTr("Lab 4") }
    }


}
