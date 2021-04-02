import QtQuick.Window 2.15
import QtQuick 2.9
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1


Row {
    id: root

    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise", "About"]
    property int btnBorderWidth: 2
    property string btnBorderColor: "blue"
    property int fontSize: 10
    signal menuClicked(string text)
    signal menuIndClicked(int index)
    property bool _isDirty: true        // Has the document got unsaved changes?
    property string _fileName           // The filename of the document
    property bool _tryingToClose: false // Is the window trying to close (but needs a file name first)?

    property string filePath: ""  // the path of a selected file


    function saveAsDocument() {
        saveAsDialog.open();
    }

    function saveDocument() {
        if (filePath.length === 0) {
            root.saveAsDocument();
        } else {
            // Save document here
            console.log("Saving document: ", filePath)
            root._isDirty = false;

            if (root._tryingToClose)
                root.close();
        }
    }


    Repeater {
        model: menuItems.length
        Button {
            id: control
            background: Rectangle {
                id: menuButtonRect
                border.width: btnBorderWidth
                border.color: btnBorderColor
                color: control.down ? "#d0d0d0" : "#e0e0e0"
            }
            contentItem:  Text {
                text: menuItems[index]
                font.pointSize: fontSize
            }

            onClicked: {
                menuClicked(menuItems[index])
                menuIndClicked(index)
                menuButtonRect.color = "lightgray"

                if(menuItems[index] === 'Open'){
                    openFileDialog.open()
                }

                if(menuItems[index] === 'Save'){
                    root.saveDocument()
                }
                if(menuItems[index] === 'About'){
                    if (switcher === 1){
                        about.visible = true
                        switcher = switcher * -1
                        logo.source = "images/jsoneditor_logo_pressed.svg"
                    }

                    else{
                        about.visible = false
                        switcher = switcher * -1
                        logo.source = "images/jsoneditor_logo.svg"
                        menuButtonRect.color = "#e0e0e0"
                    }
                }
            }
        }
    }

    FileDialog {
        id: saveAsDialog
        fileMode:  FileDialog.SaveFile
        nameFilters: ["Text files {*.txt *.json *.csv}"]
        onAccepted: {
            root._fileName = saveAsDialog.file
            saveDocument();
        }
    }


    FileDialog {
        id: openFileDialog
        fileMode: FileDialog.OpenFile
        nameFilters: ["Text files {*.txt *.json *.csv}"]
        onAccepted: {
            filePath = openFileDialog.file.toString().substr(8)
        }
    }
}
