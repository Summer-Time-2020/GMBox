import QtQuick 2.0

Rectangle {
    color : "#A9AC97"
    opacity: 0.98

    /* 显示更新内容*/
    Rectangle{
        id : viewChangList
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -95
        width: 466
        height : 256
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
    }

    /* 显示软件相关信息 */
    Rectangle{
        id : viewSoftwareInfo
        anchors.top : viewChangList.bottom
        anchors.topMargin: 22
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -123
        width: 466
        height : 152
        color : "#636D64"
        anchors.horizontalCenterOffset: 10
        opacity: 0.98

        Image {
            id : viewSoftwareInfoImage
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 10
            width: 25
            height: 25
            source: "image/info.png"
        }

        Text {
             text: "版本 0.0.0.1（测试版本）"
             color: "#f1f1f1"
             anchors.left: viewSoftwareInfoImage.right
             anchors.leftMargin: -25
             anchors.top: parent.top
             anchors.topMargin: 49
             font.family: "Helvetica"
             font.pixelSize: 12
         }

        Text {
             text: "GMBox 版权所有2021 Summer-Time-2020 保留所有权利"
             color: "#f1f1f1"
             anchors.left: viewSoftwareInfoImage.right
             anchors.leftMargin: -25
             anchors.top: parent.top
             anchors.topMargin: 115
             font.family: "Helvetica"
             font.pixelSize: 12
         }

        Text {
             text: "GMBox 源码地址：https://github.com/Summer-Time-2020/GMBox"
             color: "#f1f1f1"
             anchors.left: viewSoftwareInfoImage.right
             anchors.leftMargin: -25
             anchors.top: parent.top
             anchors.topMargin: 80
             font.family: "Helvetica"
             font.pixelSize: 12
         }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
