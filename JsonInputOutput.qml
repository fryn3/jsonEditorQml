import QtQuick 2.9
import QtQuick.Controls 2.15

Rectangle {
    ScrollView {
        id: scrollView1
        anchors.fill: parent
        focus: true
        TextArea {
            id: textArea
            focus: true
            placeholderText: "Json Input"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            text: ""
            font.pointSize: fontPointSize
            wrapMode: TextEdit.WordWrap
        }
    }
    MouseArea {
        anchors.fill: parent;
        onClicked: { scrollView1.focus = true }
    }
}
