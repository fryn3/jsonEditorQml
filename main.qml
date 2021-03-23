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
        id: menu
        spacing: space
        leftPadding: space
        topPadding: space
        btnBorderWidth: root.borderWidth
        btnBorderColor: borderColor
        fontSize: fontPointSize
        onMenuClicked: {
            console.log(this)
        }
    }

    Item {
        id: jsonItem
        anchors.left: parent.left
        anchors.right: managment.left
        anchors.top: menu.bottom
        anchors.bottom: parent.bottom

        // блок ввода jsom
        JsonInputOutput {
            id: jsonText
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
            id: jsonTree
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: space
            anchors.leftMargin: 0
            model: appEngine ? appEngine.jsonModel() : null
            selection: ItemSelectionModel {
                model: appEngine ? appEngine.jsonModel() : null
                onCurrentChanged: { // current, previous
                    managment.changedCurrentIndex(current)
                }
            }
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
        }
    }

    // блок управления
    ManagmentBlock {
        id: managment
        anchors.top: menu.bottom
        anchors.right: parent.right
        anchors.margins: space

        tableBorderWidth: borderWidth
        tableBorderColor: borderColor
        columnWidthFirst: 70
        columnWidthSecond: 170
        rowHeight: 40
        fontSize: fontPointSize
        modelSourse: appEngine ? appEngine.jsonModel() : ""
    }


    // логотип
    Image {
        id: logo

        anchors.top: managment.bottom
        anchors.bottom: buttonsBlock.top
        anchors.left: managment.left
        anchors.right: parent.right
        anchors.margins: space

        source: "images/jsoneditor_logo.svg"
        fillMode: Image.PreserveAspectFit

    }

    // блок потомки родственники
    ButtonBlock {
        id: buttonsBlock

        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: space
        }

        width: managment.width
        height: 60
        tableBorderWidth: 1
        tableBorderColor: borderColor
        fontSize: fontPointSize

        onClickedChild: {
            console.log("add child")
        }

        onClickedSibling: {
            console.log("add sibling")
        }
    }
}

