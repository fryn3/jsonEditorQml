import QtQuick 2.12
import QtQuick.Controls 2.15

import cpp.QJsonModel 12.34

Item {
    id: item4Rect

    width: columnWidthFirst + columnWidthSecond
    height: column.children.length * rowHeight
    property var modelSourse: ""
    enum TypesEnum {
        Null, Bool, Number, String, Array, Object
    }
    property var typesList: [ "Null", "Bool", "Number", "String", "Array", "Object" ]
    property int tableBorderWidth: 2
    property string tableBorderColor: "yellow"
    property int columnWidthFirst: 60
    property int columnWidthSecond: 2 * columnWidthFirst
    property int rowHeight: 40

    function typeOfModelIndex(i) {
        if (modelSourse === "") {
            console.assert('bad model')
            return
        }
        var _value = modelSourse.data(i, QJsonModel.ColValue)
        var _type = modelSourse.data(i, QJsonModel.ColType)
        if (_type.startsWith('Object')) {
            return ManagmentBlock.TypesEnum.Object
        } else if (_type.startsWith('Array')) {
            return ManagmentBlock.TypesEnum.Array
        } else if (!_value) {
            return ManagmentBlock.TypesEnum.Null
        } else if (typeof _value === "number") {
            return ManagmentBlock.TypesEnum.Number
        } else if (typeof _value === "string") {
            return ManagmentBlock.TypesEnum.String
        } else if (typeof _value === "boolean") {
            return ManagmentBlock.TypesEnum.Bool
        }
        console.assert('unknow type')
    }

    function changeFields(currentIndex) {
        tfKey.text = modelSourse.data(currentIndex, QJsonModel.ColKey)
        // Если родитель имеет тип Array, то ключ currentIndex (индекс)
        // не изменяется.
        if (currentIndex.parent.valid
                && typeOfModelIndex(currentIndex.parent)
                                === ManagmentBlock.TypesEnum.Array) {
            tfKey.enabled = false
         } else {
            tfKey.enabled = true
        }

        tfValue.text = modelSourse.data(currentIndex, QJsonModel.ColValue) ?? ""

        combo.currentIndex = typeOfModelIndex(currentIndex)
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
                enabled: {
                    (combo.currentIndex === ManagmentBlock.TypesEnum.Bool
                        || combo.currentIndex === ManagmentBlock.TypesEnum.Number
                        || combo.currentIndex === ManagmentBlock.TypesEnum.String)
                }

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
