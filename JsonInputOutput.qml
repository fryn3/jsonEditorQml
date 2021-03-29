import QtQuick 2.9
import QtQuick.Controls 2.15

Rectangle {
    property alias jsonText: textArea.text
    property alias jsonTextArea: textArea
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
            font.family: "Consolas"
            wrapMode: TextEdit.WordWrap
            readOnly: true
            selectByMouse: true
        }
    }
    MouseArea {
        anchors.fill: parent;
        onClicked: { scrollView1.focus = true }
    }
}
