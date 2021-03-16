import QtQuick 2.12
import QtQuick.Controls 2.15

import cpp.QJsonModel 12.34

Item {
    id: item4Rect

    width: columnWidthFirst + columnWidthSecond
    height: column.children.length * rowHeight
    property var modelSourse: ""
    enum TypesEnum {
        Null, Bool, Double, String, Array, Object
    }
    property var typesList: [ "Null", "Bool", "Double", "String", "Array", "Object" ]
    property int tableBorderWidth: 2
    property string tableBorderColor: "yellow"
    property int columnWidthFirst: 60
    property int columnWidthSecond: 2 * columnWidthFirst
    property int rowHeight: 40

    function changeFields(currentIndex) {
        tfKey.text = modelSourse.data(currentIndex, QJsonModel.ColKey)
        var _value = modelSourse.data(currentIndex, QJsonModel.ColValue)
        tfValue.text = _value ?? ""
        var _type = modelSourse.data(currentIndex, QJsonModel.ColType)
        if (_type.startsWith('Object')) {
            combo.currentIndex = ManagmentBlock.TypesEnum.Object
        } else if (_type.startsWith('Array')) {
            combo.currentIndex = ManagmentBlock.TypesEnum.Array
        } else if (!_value) {
            combo.currentIndex = ManagmentBlock.TypesEnum.Null
        } else if (typeof _value === "number") {
            combo.currentIndex = ManagmentBlock.TypesEnum.Double
        } else if (typeof _value === "string") {
            combo.currentIndex = ManagmentBlock.TypesEnum.String
        } else if (typeof _value === "boolean") {
            combo.currentIndex = ManagmentBlock.TypesEnum.Bool
        }

        console.log(modelSourse.data(currentIndex, QJsonModel.ColValue))
        console.log(modelSourse.data(currentIndex, QJsonModel.ColType))
        console.log(typeof modelSourse.data(currentIndex, QJsonModel.ColType))
        console.log(modelSourse.data(currentIndex, QJsonModel.ColType).startsWith('Object'))
        console.log(modelSourse.data(currentIndex, QJsonModel.ColType).startsWith('Array'))
    }

    Column {
        id: column
        spacing: -tableBorderWidth
        Row {
            id: row1
            spacing: -tableBorderWidth
            Rectangle {
                id: keyRect
                width: columnWidthFirst
                height: rowHeight
                border.color: tableBorderColor
                border.width: tableBorderWidth
                color: textAreaColor
                Text {
                    anchors.fill: parent
                    anchors.margins: space
                    verticalAlignment: Text.AlignVCenter
                    id: keyText
                    text: qsTr("Key")
                    font.pointSize: fontPointSize
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: { tfKey.focus = true }
                }
            }
            TextField {
                id: tfKey
                width: columnWidthSecond
                height: rowHeight

                font.pointSize: fontPointSize
                focus: true
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
            }
        }
        Row {
            id: row2
            spacing: -tableBorderWidth
            Rectangle {
                id: typeRect
                width: columnWidthFirst
                height: rowHeight
                border.color: tableBorderColor
                border.width: tableBorderWidth
                color: textAreaColor
                Text {
                    anchors.fill: parent
                    anchors.margins: space
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Type")
                    font.pointSize: fontPointSize
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: { combo.popup.open() }
                }
            }
            ComboBox {
                id: combo

                width: columnWidthSecond
                height: rowHeight
                focus: true
                editable: false
                font.pointSize: fontPointSize
                model: typesList
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
            }
        }
        Row {
            id: row3
            spacing: -tableBorderWidth
            Rectangle {
                id: valueRect
                width: columnWidthFirst
                height: rowHeight
                border.color: tableBorderColor
                border.width: tableBorderWidth
                color: textAreaColor
                Text {
                    anchors.fill: parent
                    anchors.margins: space
                    verticalAlignment: Text.AlignVCenter
                    id: valueText
                    text: qsTr("Value")
                    font.pointSize: fontPointSize
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: { tfValue.focus = true }
                }
            }
            TextField {
                id: tfValue
                width: columnWidthSecond
                height: rowHeight

                font.pointSize: fontPointSize
                focus: true
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
            }
        }
    }
}
