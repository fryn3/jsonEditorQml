#pragma once

#include <QQmlEngine>

namespace My {

template<class C>
bool qmlRegisterType(QString itemName) {
    qmlRegisterType<C>(QString("cpp.%1").arg(itemName).toUtf8(),
                       12, 34, itemName.toUtf8());
    return true;
}

}   // namespace My
