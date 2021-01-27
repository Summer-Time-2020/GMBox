import QtQuick 2.0

Rectangle {
    color : "#A9AC97"
    opacity: 0.98

    /* 显示更新内容*/
    Rectangle{
        id : viewChangList
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -123
        width: 466
        height : 200
        color : "#636D64"
        anchors.horizontalCenterOffset: 10
        opacity: 0.98

        Image {
            id : viewChangListImage
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 10
            width: 25
            height: 25
            source: "image/tip.png"
        }

        Text {
             text: "更新"
             color: "#f1f1f1"
             anchors.left: viewChangListImage.right
             anchors.leftMargin: 6
             anchors.top: parent.top
             anchors.topMargin: 10
             font.family: "Times"
             font.pixelSize: 15
         }
    }

    /* 显示软件相关信息 */
    Rectangle{
        id : viewSoftwareInfo
        anchors.top : viewChangList.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -123
        width: 466
        height : 200
        color : "#636D64"
        anchors.horizontalCenterOffset: 10
        opacity: 0.98
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
