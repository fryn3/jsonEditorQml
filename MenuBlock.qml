import QtQuick 2.9
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import Qt.labs.platform 1.1
import QtQuick.Window 2.15



Row {
    id: rowMenu

    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    property int btnBorderWidth: 2
    property string btnBorderColor: "blue"
    property int fontSize: 10
    signal menuClicked(string text)
    signal menuIndClicked(int index)

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
                    console.log("Open button pushed")
                    openFileDialog.open()
                }
            }
        }
    }
    FileDialog {
        id: openFileDialog
        nameFilters: ["Text files {*.txt *.json *.csv}"]
    }
}
