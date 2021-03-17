import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    signal clickedChild()
    signal clickedSibling()
    property int tableBorderWidth: 2
    property string tableBorderColor: "yellow"
    property int fontSize: 10

    Button {
        id: addChild
        anchors.left: parent.left
        width: parent.width / 2
        height: parent.height
        text: "Add Child"
        font.pointSize: fontSize

        background: Rectangle {
            opacity: enabled ? 1 : 0.3
            color: addChild.down ? "#d0d0d0" : "#e0e0e0"
            border.color: tableBorderColor
            border.width: tableBorderWidth
        }

        onClicked: {
            root.clickedChild()
        }
    }


    Button {
        id: chSibl
        anchors.right: parent.right
        anchors.rightMargin: tableBorderWidth
        width: parent.width / 2
        height: parent.height
        text: "Add Sibling"
        font.pointSize: fontSize

        background: Rectangle {
            opacity: enabled ? 1 : 0.3
            color: chSibl.down ? "#d0d0d0" : "#e0e0e0"
            border.color: tableBorderColor
            border.width: tableBorderWidth
        }

        onClicked: {
            root.clickedSibling()
        }
    }
}
