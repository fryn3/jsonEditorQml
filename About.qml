import QtQuick.Window 2.15
import QtQuick 2.9
import QtQuick.Controls 1.4



Rectangle {
    property string fileContents: ""

    id: about
    width: root.width * 0.5
    height: root.height * 0.5
    anchors.centerIn: root
    opacity: 0.7
    z: 10

    Component.onCompleted: {
            var request = new XMLHttpRequest();
            request.onreadystatechange = function() {
                console.log("Ready state changed: %1".arg(request.readyState));
                if (request.readyState === XMLHttpRequest.DONE) {
                    fileContents = request.responseText;
                }
            }
            request.open("GET", "images/about.txt", true);
            request.send();
            console.log("Sending request");
        }

    TextArea {
        anchors.centerIn: parent
        width: parent.width - 2 * space
        height: parent.height - 2 * space
        id: textAreaAbout
        readOnly: true

        text: fileContents == "" ? "<Still loading>" : fileContents

        font.pointSize: fontPointSize
        font.family: "Consolas"
    }
}

