import QtQuick 2.9
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1
import QtQuick.Window 2.15



Row {
    id: root

    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    property int btnBorderWidth: 2
    property string btnBorderColor: "blue"
    property int fontSize: 10
    signal menuClicked(string text)
    signal menuIndClicked(int index)
    property bool _isDirty: true        // Has the document got unsaved changes?
    property string _fileName           // The filename of the document
    property bool _tryingToClose: false // Is the window trying to close (but needs a file name first)?


    function saveAsDocument() {
        saveAsDialog.open();
    }

    function saveDocument() {
        if (_fileName.length === 0) {
            root.saveAsDocument();
        } else {
            // Save document here
            console.log("Saving document: ", _fileName)
            root._isDirty = false;

            if (root._tryingToClose)
                root.close();
        }
    }

    FileDialog {
        id: saveAsDialog
        onAccepted: {
          root._fileName = saveAsDialog.file
          saveDocument();
        }
    }

    FileDialog {
        id: openFileDialog
        nameFilters: ["Text files {*.txt *.json *.csv}"]
    }

    Repeater {
        model: menuItems.length
        Button {
            id: control
            background: Rectangle {
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
                if(menuItems[index] === 'Open'){
                    openFileDialog.open()
                }
                if(menuItems[index] === 'Save'){
                    root.saveDocument()
                }
            }
        }
    }

}
