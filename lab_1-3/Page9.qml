import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14
import QtCharts 2.3

Page {
    id: page9
    header:
        ToolBar{
        anchors.top: parent.top
        background: Rectangle{
            implicitHeight: 50
            width: parent.width

            Text {
                id: txt479
                anchors.verticalCenter: parent.verticalCenter
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.right: txt4479.left
                font.pointSize: 35
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ff8c00"
                text: "9"
            }
            Text {
                id: txt4479
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 25
                font.family: "Dupe"
                //font.italic: true
                font.bold: true
                color: "#ffffff"
                text: "lab"
            }

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#1e90ff" }
                GradientStop { position: 0.25; color: "#1e90ff" }
                GradientStop { position: 0.5; color: "#1e90ff" }
                GradientStop { position: 0.75; color: "#1e90ff" }
                GradientStop { position: 1.0; color: "#1e90ff" }
            }
        }
    }

    Connections{
        target: qhttpcontroller
        function onToQML9(nature, phone, game, car, avatar, /*newalbum*/){
            crb91.values = [nature];
           // console.log(more + " alimore");
            //crb91.max = more;
            crb92.values = [phone];
            crb93.values = [game];
            crb94.values = [car];
            crb95.values = [avatar];
           // crb96.values = [newalbum];
//            if(more>less){bvl91.max = more /* + bvl91.tickCount*/;}
//            else if(less>more){bvl91.max = less /* + bvl91.tickCount*/;}
//            else {bvl91.max = between}
        }
    }

    ChartView{
        id: crt91
        anchors.fill: parent
        title: "Количество фото в альбоме"
        legend.alignment: Qt.AlignBottom
        //antialiasing: true
        BarSeries{ //данные (пары X-Y)

            axisX: BarCategoryAxis { categories: ["Current"]/*; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
            // axisY: bvl91
            axisY: ValueAxis{id: bvl91; min: 0; max: 10; /* tickCount: 2; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
            BarSet{
                id: crb91;
                label: "Природа";
                //values: [1]
                //values: [Qt.point(0, 5), Qt.point(2, 1), Qt.point(3, 5)]
            }
            BarSet{
                id: crb92;
                label: "Телефоны";
               // values: [1]
                color: "red"
            }
            BarSet{
                id: crb93;
                label: "Игры";
                //values: [1]
            }
            BarSet{
                id: crb94;
                label: "Машины";
                //values: [1]
            }
            BarSet{
                id: crb95;
                label: "Фото со мной";
                //values: [1]
            }
        }
    }
}
