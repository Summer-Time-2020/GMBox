import QtQuick 2.0
import "qrc:/MaterialUI/"
import "qrc:/MaterialUI/Interface/"

Rectangle {
    id: sideBar
    property int sideBarHeight : 50
    property int sideBarWidth : 150
    property string currentItemTitleNameLabel : ""

    anchors.left: parent.left
    anchors.bottom: parent.bottom
    height: sideBarHeight
    width: sideBarWidth

    color: "#5E5F5A"

    /* LOGO */
    Rectangle{
        id: logoRectangle
        anchors.top: parent.top
        width: parent.width
        height: parent.width
        color: parent.color
        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 50
            height: 50
            color: parent.color
            Image {
                id: name
                x: -7
                y: -14
                source: "image/technology.png"
            }
        }
    }

    /* option */
    Rectangle{
        id :menuOption
        anchors.top: logoRectangle.bottom
        width: parent.width
        height: sideBar.height - logoRectangle.height
       // color:  parent.color
        color: "#5E5F5A"

        Component.onCompleted: {

            /* 初始化选项列表 */
            bookmarkListView.refresh(
                [
                    {
                        bookmarkName: "杂凑算法",
                        titleName: "杂凑算法",
                        qrcLocation: "",
                        children:
                        [
                            { bookmarkName: "SM3", titleName: "SM3", qrcLocation: "qrc:/Utf16Transform/Utf16Transform.qml" },
                            { bookmarkName: "MD5", titleName: "MD5", qrcLocation: "qrc:/JsonFormat/JsonFormat.qml" }
                        ]
                    },
                    {
                        bookmarkName: "对称算法",
                        titleName: "对称算法",
                        qrcLocation: "",
                        children:
                        [
                            { bookmarkName: "SM4", titleName: "SM4", qrcLocation: "qrc:/Utf16Transform/Utf16Transform.qml" },
                            { bookmarkName: "AES", titleName: "AES", qrcLocation: "qrc:/JsonFormat/JsonFormat.qml" }
                        ]
                    },
                    {
                        bookmarkName: "非对称算法",
                        titleName: "非对称算法",
                        qrcLocation: "",
                        children:
                        [
                            { bookmarkName: "SM2", titleName: "SM2", qrcLocation: "qrc:/HashCalculate/HashCalculate.qml" },
                            { bookmarkName: "RSA", titleName: "RSA", qrcLocation: "qrc:/TimestampTransform/TimestampTransform.qml" }
                        ]
                    },
                    {
                        bookmarkName: "随机数检测",
                        titleName: "随机数检测",
                        qrcLocation: "",
                        children:
                        [
                            { bookmarkName: "NIST", titleName: "NIST", qrcLocation: "qrc:/Utf16Transform/Utf16Transform.qml" },
                            { bookmarkName: "GM", titleName: "GM", qrcLocation: "qrc:/JsonFormat/JsonFormat.qml" }
                        ]
                    }
                ] );
        }

        ListView {
            id: bookmarkListView
            y: 0
            width: parent.width
            height: parent.height
            cacheBuffer: 9999

            model: ListModel {
                id: bookmarkListModel
            }

            delegate: Rectangle  {
                id: bookmarkItem
                x: 0
                y: 42
                width: parent.width
                height: 40
                clip: true
                color: "#5E5F5A"

                Component.onCompleted: {
                    for ( var index = 0; index < bookmarkChildrenItem.count; ++index )
                    {
                        var buf = bookmarkChildrenItem.get(index);

                        secondBookmarkListModel.append( {
                                                              bookmarkName: buf[ "bookmarkName" ],
                                                              titleName: buf[ "titleName" ],
                                                              itemQrcLocation: buf["qrcLocation" ],
                                                          } );
                    }

                    secondBookmarkListView.height = bookmarkChildrenItem.count * 42;
                    secondBookmarkListView.y = -1 * secondBookmarkListView.height;
                }

                /* 二级菜单 */
                Rectangle {
                    x: 0
                    y: 42
                    width: parent.width
                    height: secondBookmarkListView.height
                    clip: true
                    color: "#5E5F5A"

                    ListView {
                        id: secondBookmarkListView
                        x: 0
                        y: 0
                        width: parent.width
                        height: 0
                        visible: y !== (-1 * secondBookmarkListView.height)
                        boundsBehavior: Flickable.StopAtBounds

                        //Behavior on y { NumberAnimation { easing.type: Easing.InOutQuad; duration: 400 } }

                        model: ListModel {
                            id: secondBookmarkListModel
                        }

                        delegate: Rectangle {
                            id: secondBookmarkContains
                            width: bookmarkListView.width
                            height: 42
                            color: "#5E5F5A"

                            MaterialButton {
                                anchors.fill: parent
                                elevation: 0
                                text: ""
                                visible: secondBookmarkListView.y === 0

                                MaterialLabel {
                                    x: 36
                                    height: parent.height
                                    text: bookmarkName
                                    font.pixelSize: 16
                                    verticalAlignment: Text.AlignVCenter
                                    color: ( currentItemTitleNameLabel === titleName ) ? ( "#ffffff" ) : ( "#97ac9e" )

                                    Behavior on color { ColorAnimation { duration: 200 } }
                                }

                                /* 二级菜单点击事件 */
                                onClicked: {
                                    console.log("bookmarkName=" + bookmarkName)
                                    currentItemTitleNameLabel = bookmarkName
                                    //mainPageContains.showPage( titleName, itemQrcLocation );
                                }
                            }

                            Rectangle {
                                anchors.fill: parent
                                color: "#ffffff"
                                visible: secondBookmarkListView.y !== 0

                                MaterialLabel {
                                    x: 36
                                    height: parent.height
                                    text: bookmarkName
                                    font.pixelSize: 16
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }

                MaterialButton {
                    width: parent.width
                    height: 42
                    elevation: 0
                    textHorizontalAlignment: Text.AlignLeft

                    /* 一级菜单点击事件 */
                    onClicked: {
                        console.log("1bookmarkName=" + bookmarkName)
                        //currentItemTitleNameLabel = bookmarkName
                        console.log("secondBookmarkListModel.count=" + secondBookmarkListModel.count)
                        if ( secondBookmarkListModel.count )
                        {
                            if (secondBookmarkListView.visible)
                            {
                                /* 展开二级菜单 */
                                secondBookmarkListView.y = -1 * secondBookmarkListView.height;
                                bookmarkItem.height = 42;
                            }
                            else
                            {
                                /* 缩小二级菜单 */
                                secondBookmarkListView.y = 0;
                                bookmarkItem.height = 42 + secondBookmarkListView.height;
                            }
                        }
                    }


                    MaterialLabel {
                        x: 18
                        height: parent.height
                        text: bookmarkName
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 16
                       // color: "#ffffff"
                        color : ( currentItemTitleNameLabel === titleName ) ? ( "#ffffff" ) : ( "#97ac9e" )
                    }
                }
            }


            function refresh( items ) {
                bookmarkListModel.clear();
                console.log("items.length=" +　items.length)
                for (var index = 0; index < items.length; index++)
                {
                    bookmarkListModel.append( {
                        bookmarkName: items[index]["bookmarkName"],
                        titleName: items[index]["titleName"],
                        itemQrcLocation: items[index]["qrcLocation"],
                        bookmarkChildrenItem: items[index]["children"]
                    } );
                }
            }

       }
    }

}
