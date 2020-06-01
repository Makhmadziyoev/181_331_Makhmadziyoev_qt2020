import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14


Page { // 4 ЛАБОРАТОРНАЯ
    id: page4
    Connections{
        target: qhttpcontroller
        function onToQML(pString, nString){
            txt.text = nString;
            dash.append(pString);
        }
    }
    header: Label { //
        GridLayout{
            anchors.fill: parent
            columns: 3
            RowLayout { // баннер
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
            RowLayout { // вывод числа
                Layout.column: 2
                Layout.row: 1
                Layout.columnSpan: 3
                Item{
                    Layout.fillWidth: true
                }
                Label {
                    text: "До следующего года осталось:"
                }
                TextField {
                    id: txt
                    readOnly: true
                    objectName: "textFielDate"
                    text: ""
                }
                Label {
                   text: "дней"
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
        RowLayout{ // textarea браузер
            //Layout.fillWidth: true
            Layout.column: 1
            Layout.row: 0
            //Layout.columnSpan: 3
            Rectangle{
                width: 400
                height: 300
                border.width : 10
                border.color: "#9020b5"
                ScrollView{
                    id:scrlvie
                    anchors.fill: parent
                    TextArea{
                        id: dash
                       // textFormat: Text.PlainText
                        width: 380
                        height: 250
                        Layout.fillWidth: true
                        readOnly: true
                    }
                }
            }
        }
        RowLayout{ // кнопка реализации
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
