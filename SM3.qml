
import QtQuick 2.0
import Qt.labs.platform 1.1
import GMBox 1.0
import DataModel 1.0

Rectangle {
    color : "#ffffff"
    opacity: 0.98

    /* 数据模型 */
    ListModel {
         id: listModel1
    }

    DataModel{
        id : dataModel1
    }

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
                   for(var i = 0; i < drop.urls.length; i++){
                       var path = drop.urls[i]
                       listModel1.append({txtName : path.substr(8, path.length)})
                       dataModel1.append( "filename", path.substr(8, path.length))
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
                    var path = fileDialog.currentFile.toString()
                    listModel1.append({txtName : path.substr(8, path.length)})
                    dataModel1.append( "filename", path.substr(8, path.length))
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

    /* 待计算的文件列表 */
    Rectangle{
        id: fileList
        anchors.top: loadFileLoad.bottom
        anchors.topMargin: 15
        width: parent.width-2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: sureButton.bottom
        anchors.bottomMargin: 45
        //border.color: "#000000"

        /* 列表效果 */
        Component {
            id: delegate_list1
            Rectangle {
                id: delegate_list_rct1
                height: 34
                width: ListView.view.width

                //color: ListView.isCurrentItem?"#157efb":"#FFFFFF" //选中颜色设置
                color: "#FFFFFF"
                Text {
                    x: 5
                    anchors.verticalCenter: parent.verticalCenter
                    text: dataModel1.data(index)
                    //color: ListView.isCurrentItem ? "#FFFFFF" : "#000000" //选中颜色设置
                    color: "#000000"
                }

                /*
                MouseArea {
                    anchors.fill: parent
                    onClicked:  {
                        console.log("a");
                        listView1.currentIndex = index
                    }
                }
                */

                /* 删除按钮 */
                Rectangle{
                    height: 15
                    width: 15
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    //border.color: "#000000"
                    Image {
                        id: deleteImage
                        source: "image/close2.png"
                        anchors.fill: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        propagateComposedEvents: true
                        onEntered: {
                            deleteImage.source = "image/close3.png"
                        }
                        onPressed: {
                            console.log("abc")
                            listModel1.remove(index, 1)
                            dataModel1.remove(index)
                        }
                        onExited: {
                            deleteImage.source = "image/close2.png"
                        }
                    }
                }
            }
        }

        /* 列表属性设置 */
        ListView {
            id: listView1
            anchors.fill: parent
            model: dataModel1 //dataModel1
            delegate: delegate_list1
           // highlight: highlight1 // 高亮设置
           // highlightFollowsCurrentItem: true
            focus: true // 获取焦点
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
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.color = "#2C884B"
            }
            onPressed: {
               gmbox.sm3Files(listModel1)
            }
            onExited: {
                parent.color = "#2C974B"
            }
        }
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
