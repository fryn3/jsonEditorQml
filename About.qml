import QtQuick.Window 2.15
import QtQuick 2.9
import QtQuick.Controls 1.4

Rectangle {
    id: about
    width: root.width * 0.5
    height: root.height * 0.5
    anchors.centerIn: root
    opacity: 0.7
    z: 10

    TextArea {
        anchors.centerIn: parent
        width: parent.width - 2 * space
        height: parent.height - 2 * space
        id: textAreaAbout
        readOnly: true

        text: "# JsonEditor
        JsonEditor is a small program for working with JSON files. It uses the [QJsonModel](https://github.com/fryn3/QJsonModel.git) submodule for operation.

        ![QJsonModel](https://raw.githubusercontent.com/fryn3/JsonEditor/master/screen.png)

        MIT License

        Copyright (c) 2017 sacha schutz

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the 'Software'), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
        "
        font.pointSize: fontPointSize
        font.family: "Consolas"
    }
}

