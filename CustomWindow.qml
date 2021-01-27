import QtQuick 2.0
import QtQuick.Window 2.14

Window {
    id : customWin
    property int borderlen : 0  //边框大小
    property int moveHight : 30
    property int moveDiagonalLen : 20 // 移动对角长度
    visible: true
    width: 1000
    height: 600
    title: qsTr("CustomWindow")
    flags: Qt.FramelessWindowHint | Qt.Window
    color : "#A9AC97"
    opacity: 0.98

    //设置可拖动区域
    Rectangle{
        id : moveRectangle
        height: moveHight
        width: parent.width - borderlen * 2
        anchors.top: parent.top
        anchors.topMargin: borderlen
        color: "#6b7471"

        Rectangle{
            id: titleImageRectangle
            y: 5
            anchors.left: parent.left
            anchors.leftMargin: 15
            height: 20
            width: 20
            color: "#6b7471"
            Image {
                id: name
                anchors.fill: parent
                source: "image/box.png"
            }
        }

        Text{
            id: titleText
            y: 9
            anchors.left: titleImageRectangle.right
            anchors.leftMargin: 12
            text: "GMBox"
            color: "#ffffff"
            font.bold : true
            font.pixelSize : 12
        }

        MouseWindow {
            id: centerMouse
            control : customWin
            borderlen : 4
        }
    }

    //设置左边操作栏
    SideBar{
        id : sideBar
        sideBarHeight : customWin.height - moveRectangle.height
    }

    Component.onCompleted: {
        displayInterface.changeDisplay("NoticePage.qml")
    }

    DisplayInterface{
        id: displayInterface
    }

    function uploadGui(resource)
    {
        mainLoad.source = resource
    }

    /* 关闭按钮 */
    Rectangle{
        id : closeButton
        width : 40
        height: 30
        anchors.right : parent.right
        anchors.rightMargin: borderlen
        anchors.top : parent.top
        anchors.topMargin: borderlen
        color: "#6b7471"

        Image {
            id: closeImage
            source: "image/close"
            height: 15
            width: 15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(pressed)
                {
                    closeButton.color = "#f2879e"
                }
                else
                {
                    closeButton.color = "#DC143C"
                }
                closeImage.source = "image/close1"
            }
            onExited: {
                closeButton.color = "#6b7471"
                closeImage.source = "image/close"
            }
            onPressed: {
                closeButton.color = "#f2879e"
            }
            onReleased: {
                if(closeButton.color != "#6b7471")
                {
                    customWin.visible = false
                    closeButton.color = "#6b7471"
                }
            }
        }
    }

    /* 缩小按钮 */
    Rectangle{
        id : minButton
        width : 40
        height: 30
        anchors.right : closeButton.left
        anchors.top : parent.top
        anchors.topMargin: borderlen
        color: "#6b7471"

        Image {
            id: minImage
            source: "image/minimize"
            height: 15
            width: 15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                if(pressed)
                {
                    minButton.color = "#636363"
                }
                else
                {
                    minButton.color = "#b8b8b8"
                }
            }
            onExited: {
                minButton.color = "#6b7471"
            }
            onPressed: {
                minButton.color = "#636363"
            }
            onReleased: {
                if(minButton.color != "#f4f5f5")
                {
                    customWin.showMinimized()
                    minButton.color = "#b8b8b8"
                }
            }
        }
    }
}
