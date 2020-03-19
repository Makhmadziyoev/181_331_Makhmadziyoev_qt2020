import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10

        BorderImage {
            id: borderImage
            x: 535
            y: 0
            width: 65
            height: 47
            source: "C:/Users/USER/Desktop/s1200.png"
        }
    }

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }

    BusyIndicator {
        id: busyIndicator
        x: 69
        y: 262
    }

    Button {
        id: button
        x: 153
        y: 282
        text: qsTr("Button")
    }

    CheckBox {
        id: checkBox
        x: 278
        y: 282
        text: qsTr("Check Box")
    }

    CheckDelegate {
        id: checkDelegate
        x: 393
        y: 270
        text: qsTr("Check Delegate")
    }

    BusyIndicator {
        id: busyIndicator1
        x: 184
        y: 78
    }
}
