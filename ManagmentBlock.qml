import QtQuick 2.12
import QtQuick.Controls 2.15

import cpp.QJsonModel 12.34

Item {
    id: root
    width: columnWidthFirst + columnWidthSecond - 2 + 1 // 2 - кол-во колонок
    height: (column.children.length + 1) * rowHeight - column.children.length
    property var modelSourse: null
    enum TypesEnum {
        Null, Bool, Number, String, Array, Object
    }
    property var typesList: [ "Null", "Bool", "Number", "String", "Array", "Object" ]
    property int tableBorderWidth: 2
    property string tableBorderColor: "yellow"
    property int columnWidthFirst: 60
    property int columnWidthSecond: 2 * columnWidthFirst
    property int rowHeight: 40
    property int fontSize: 10

    QtObject {
        id: m
        property string keyText: ""
        property int typeEnum: ManagmentBlock.TypesEnum.Null
        property string valueText: ""

        function saveValues() {
            keyText = tfKey.text
            typeEnum = combo.currentIndex
            valueText = tfValue.text
            isEditEnable()
        }
        function isEditEnable() {
            _btnEdit.enabled = !(keyText === tfKey.text
                                 && typeEnum === combo.currentIndex
                                 && valueText === tfValue.text)
        }
    }

    function typeOfModelIndex(i) {
        if (!modelSourse) {
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

    function changedCurrentIndex(currentIndex) {
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

        tfValue.text = modelSourse.data(currentIndex, QJsonModel.ColValue) ?? "";
        combo.currentIndex = typeOfModelIndex(currentIndex)
        m.saveValues()
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
                    id: _textKey
                    text: qsTr("Key")
                    font.pointSize: fontSize
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

                font.pointSize: fontSize
                focus: true
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
                onTextChanged: m.isEditEnable()
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
                    font.pointSize: fontSize
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
                font.pointSize: fontSize
                model: typesList
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
                onCurrentIndexChanged: m.isEditEnable()
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
                    id: _textValue
                    text: qsTr("Value")
                    font.pointSize: fontSize
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

                font.pointSize: fontSize
                focus: true
                background: Rectangle {
                    border.color: tableBorderColor
                    border.width: tableBorderWidth
                    color: textAreaColor
                }
                onTextChanged: m.isEditEnable()
            }
        }
    }

    Button {
        id: _btnEdit
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: column.bottom
        anchors.topMargin: -1
        height: rowHeight
        text: "Edit"
        font.pointSize: fontSize
        background: Rectangle {
            opacity: enabled ? 1 : 0.3
            color: parent.down ? "#d0d0d0" : "#e0e0e0"
            border.color: tableBorderColor
            border.width: tableBorderWidth
        }
        //        enabled: m.isEditEnable()
    }
}
