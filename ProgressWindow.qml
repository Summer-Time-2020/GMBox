import QtQuick 2.7
import QtQuick.Window 2.2
import CustomControls 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

/* 进度条窗口 */
Window {
    id : progressWindow
    visible: false
    width: 150
    height: 150
    title: qsTr("ProgressWindow")
    flags: Qt.FramelessWindowHint | Qt.Window
    color : "#ffffff"
    //visibility: false
    //opacity: 1

    property int columns : 3
    property int rows : 2

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 50
        RowLayout {
            id: layout
            spacing: 30
            RadialBar {
                width: 150
                height: 150
                penStyle: Qt.RoundCap
                dialType: RadialBar.FullDial
                opacity: 1
                progressColor: "#1dc58f"
                foregroundColor: "#191a2f"
                dialWidth: 22
                startAngle: 180
                spanAngle: 70
                minValue: 0
                maxValue: 100
                value: 10
                textFont {
                    family: "Halvetica"
                    italic: false
                    pointSize: 15
                }
                suffixText: "%"
                textColor: "#000000"
            }
        }
    }
}
