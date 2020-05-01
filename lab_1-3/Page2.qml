import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 2 ЛАБОРАТОРНАЯ
    id: page2
    header: Label { // ПЕРЕКЛЮЧЕНИЕ МЕЖДУ ПЛЕЕРОМ И КАМЕРОЙ
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
    
    GridLayout{   // МЕДИАПЛЕЕР
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
                    
                    prosmotr.sync = true
                    prosmotr.value = player.position
                    prosmotr.sync = false
                }
                
            }
            VideoOutput {
                id: vid
                source: player
            }
            
            
        }
        
        RowLayout{ //Таймлайн видео
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
    
    GridLayout {   //Camera
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
                    
                    videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitrateEncoding;
                    videoRecorder.audioBitRate:   128000
                    videoRecorder.mediaContainer:   "mp4"
                    videoRecorder.outputLocation: "F:/git_qt/181_331_Makhmadziyoev_qt2020/lab_1-3/video"
                    videoRecorder.frameRate: 30.000
                    
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
