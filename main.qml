import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15




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

    property int switcher: 1




    width: 1000
    minimumWidth: 480
    height: 600
    minimumHeight: 300
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)


    About{
        id: about
        visible: false
        anchors.centerIn: parent
    }



    // строка меню
    MenuBlock {
        id: menu
        spacing: space
        leftPadding: space
        topPadding: space
        btnBorderWidth: root.borderWidth
        btnBorderColor: borderColor
        fontSize: fontPointSize
    }

    Item {
        id: jsonItem
        anchors.left: parent.left
        anchors.right: managment.left
        anchors.top: menu.bottom
        anchors.bottom: parent.bottom

        // блок ввода jsom
        JsonInputOutput {
            id: jsonInput
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: space

            border {
                width: borderWidth
                color: borderColor
            }

            jsonText: {
                appEngine.jsonModel().toByteArray(true)
            }

            Component.onCompleted: {
                jsonTextArea.focus = false

            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log(jsonInput.Text)
                    jsonInput.jsonTextArea.deselect()
                }
                onDoubleClicked: {
                    jsonInput.jsonTextArea.selectAll()
                }
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

            // selection выделение строки при нажатии мыши
            // current возвращает индекс строки
            selection: ItemSelectionModel {
                id: slction
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

        //
        modelSourse: appEngine ? appEngine.jsonModel() : ""
    }


    // логотип
    Image {
        id: logo
        property var xhr: new XMLHttpRequest
        anchors{
            top: managment.bottom
            bottom: buttonsBlock.top
            left: managment.left
            right: parent.right
            margins: space
        }
        source: "images/jsoneditor_logo.svg"
        fillMode: Image.PreserveAspectFit

        scale: aboutMouseArea.containsMouse ? 0.9 : 1

        MouseArea{
            id: aboutMouseArea
            anchors.fill: parent
            property int j: 1
            // source: aboutMouseArea.pressed "images/jsoneditor_logo_pressed.svg" ? : "images/jsoneditor_logo.svg"

            onClicked: {
                if (switcher === 1){
                    about.visible = true
                    switcher = switcher * -1
                    logo.source = "images/jsoneditor_logo_pressed.svg"
                }

                else{
                    about.visible = false
                    switcher = switcher * -1
                    logo.source = "images/jsoneditor_logo.svg"
                }
            }
        }
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

