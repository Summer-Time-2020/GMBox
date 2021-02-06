import QtQuick 2.0
import Qt.labs.platform 1.1

Rectangle {
    color : "#ffffff"
    opacity: 0.98

    /* 文件导入栏 */
    Rectangle{
        id: loadFileLoad
        color: "#ffffff"
        anchors.top: parent.top
        width: parent.width
        height: parent.height*0.5
        border.color: "#f1f1f1"
        border.width: 5
        Image {
            source: "image/file.png"
            height: 64
            width: 64
            anchors.verticalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        /* 文件拖到逻辑 */
        DropArea{
           anchors.fill: parent;
           onEntered: {
               console.log("DropArea onEntered")
               loadFileLoad.color = "#ebebf3"
           }
           onExited: {
               console.log("DropArea onExited")
                loadFileLoad.color = "#ffffff"
           }
           onDropped: {
               loadFileLoad.color = "#ffffff"
               if(drop.hasUrls){
                   console.log(drop.urls.length);
                   for(var i = 0; i < drop.urls.length; i++){
                       console.log(drop.urls[i]);
                   }
               }
           }
        }

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.bold : true
            font.pointSize: 20
            text: "将文件拖动到此处"
        }

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 30
            font.bold : true
            font.pointSize: 14
            text: "或者          "
        }

        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: 26
            color: parent.color
            height: 18
            width: 113
            MouseArea{
                 anchors.fill: parent
                 cursorShape: Qt.OpenHandCursor
                 onPressed: {
                      fileDialog.open()
                 }
            }

            FileDialog{
                id: fileDialog
                folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
                onFileChanged: {
                    console.log("fileDialog onFileChanged")
                }
            }
        }

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 30
            font.bold : true
            font.pointSize: 14
            color: "#0366D6"
            text: "     选择您的文件"
        }
    }

    /* 按钮 */
    Rectangle{
        id : sureButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        width: 150
        height: 30
        radius: 5
        color: "#2C974B"
        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            text: "确 定"
            font.pixelSize: 17
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
