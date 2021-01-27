import QtQuick 2.0

/* 显示界面 */
Rectangle{
    id :  displayInterface
    anchors.left: sideBar.right
    anchors.top: moveRectangle.bottom
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    color: "#123456"
    //opacity : 0

    Loader{
        anchors.fill: parent
        id : displayInterfaceLoadr
    }

    function changeDisplay(resource)
    {
        displayInterfaceLoadr.source = resource
    }

}
