import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page { // 4 ЛАБОРАТОРНАЯ
    id: page4
    header: Label { //
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
                
                Button {
                    text: "Запросы к серверу по протоколу"
                }
                
                Item{
                    Layout.fillWidth: true
                }
            }
        }
        
        
    }
    GridLayout {
        anchors.fill: parent
        columns: 3
        RowLayout{
            //Layout.fillWidth: true
            Layout.column: 1
            Layout.row: 0
            //Layout.columnSpan: 3
            Rectangle{
                width: 200
                height: 300
                border.width : 10
                border.color: "#9020b5"
                TextArea{
                    id: dash
                    width: 180
                    height: 250
                    Layout.fillWidth: true
                    readOnly: true
                }
            }
        }
        RowLayout{
            //Layout.fillWidth: true
            Layout.column: 3
            Layout.row: 2
            Layout.columnSpan: 3
            Button{
                text: "ВЫВОД"
                Layout.fillWidth: true
                onClicked: {
                    makeRequest();
                }
            }
            
        }
        
        
        
    }
    
    
}
