import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400


    header: Label {
        color: "#9020b5"
        text: qsTr("MegaFon")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    /*RadioButton{
        id:rb
    }
    RadioButton{
        id:rb1
        anchors.left: rb.right
    }
    RadioButton{
        id:rb2
        anchors.left: rb1.right
    }
    */
    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
