import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
//import QtQuick.Controls 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

import cpp.AppEngine 12.34
import cpp.QJsonModel 12.34

Window {
    id: root
    property string projectName: "Json Editor"
    property int fontPointSize: 12
    property int borderWidth: 1
    property string borderColor: "black"
    property int space: 10
    property string textAreaColor: "#e9e9e9"

    width: 1000
    minimumWidth: 480
    height: 600
    minimumHeight: 300
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)

    // строка меню
    MenuBlock {
        id: item1
        spacing: space
        leftPadding: space
        topPadding: space
        btnBorderWidth: root.borderWidth
        btnBorderColor: borderColor
        onMenuClicked: {
            console.log("menuClicked: " + text)
        }
    }

    Item {
        id: row
        anchors.left: parent.left
        anchors.right: item4.left
        anchors.top: item1.bottom
        anchors.bottom: parent.bottom
        Component.onCompleted: {
            console.log(row.width)
            console.log(row.height)
        }

        // блок ввода jsom
        JsonInputOutput {
            id: item2
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: space
            border {
                width: borderWidth
                color: borderColor
            }
        }

        // блок вывода json
//        JsonInputOutput {
        TreeView {
            id: item3
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: space
            anchors.leftMargin: 0
            model: appEngine.jsonModel()
            selection: appEngine.selectionJsonModel()
            TableViewColumn {
                title: "key"
                role: "key"
                width: 100
            }
            TableViewColumn {
                title: "value"
                role: "value"
                width: 100
            }
            TableViewColumn {
                title: "type"
                role: "type"
                width: 100
            }
//            border {
//                width: borderWidth
//                color: borderColor
//            }
        }
    }

    // блок управления
    ManagmentBlock {
        id: item4
        anchors.top: item1.bottom
        anchors.right: parent.right
        anchors.margins: space

        tableBorderWidth: borderWidth
        tableBorderColor: borderColor
        columnWidthFirst: 80
        rowHeight: 60
    }


    // логотип
    Image {
        id: logo

        anchors.top: item4.bottom
        anchors.bottom: item5.top
        anchors.left: item4.left
        anchors.right: parent.right
        anchors.margins: space

        source: "images/jsoneditor_logo.svg"
        fillMode: Image.PreserveAspectFit

    }

    // блок потомки родственники
    ButtonBlock {
        id: item5

        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: space
        }

        width: item4.width
        height: 60
        tableBorderWidth: 1
        tableBorderColor: borderColor

        onClickedChild: {
            console.log("add child")
        }

        onClickedSibling: {
            console.log("add sibling")
        }
    }
}

