import QtQuick 2.0
import QtQuick.Window 2.14

MouseArea {
    id: mouseArea
    anchors.fill: parent
    property real lastX: 0
    property real lastY: 0
    property real lastWidth: 0
    property real lastHeight: 0
    property bool mask: false       //屏蔽拖动
    property var control: parent    //拖动目标
    property var mainWindow: parent
    property int screenHeight: Screen.desktopAvailableHeight     //屏幕高度
    property int screenWidth: Screen.desktopAvailableWidth     //屏幕高度
    property int borderlen : 4

    propagateComposedEvents: true // 事件传递
    hoverEnabled: true

    onPressed: {
        console.log("onPressed-2")
        lastX = mouseX;
        lastY = mouseY;
    }

    onContainsMouseChanged: {
        /* 修改鼠标样式为移动 */
        if (containsMouse) {
           //cursorShape = .SizeAllCursor;
        } else {
          // cursorShape = Qt.ArrowCursor;
        }
    }
    onPositionChanged: {
        //console.log("onPositionChanged")
        if (!mask && control && pressed)
        {
            var x = control.x + mouseX - lastX
            var y = control.y + mouseY - lastY
            if(y <= 0)
            {
                /* 窗口移动到顶部,则禁止往上移动 */
                y = 0
            }
            if(y >= screenHeight -  borderlen)
            {
                /* 窗口移动到底部，则禁止往下移动 */
               y = screenHeight - borderlen
            }
            control.x = x
            control.y = y
        }
    }
}
