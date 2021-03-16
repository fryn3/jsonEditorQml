#include "appengine.h"
#include "myfunc.h"

const QString AppEngine::ITEM_NAME = "AppEngine";
const bool AppEngine::IS_QML_REG = My::qmlRegisterType<AppEngine>(AppEngine::ITEM_NAME);

AppEngine::AppEngine(QObject *parent)
    : QObject(parent), _jsonModel(this), _selectionModel(&_jsonModel, this) {
    std::string json = R"({
                       "firstName": "John",
                       "lastName": "Smith",
                       "age": 25,
                       "address":
                       {
                           "streetAddress": "21 2nd Street",
                           "city": "New York",
                           "state": "NY",
                           "postalCode": 10021
                       },
                       "phoneNumber":
                       [
                           {
                             "type": "home",
                             "number": "212 555-1234"
                           },
                           {
                             "type": "fax",
                             "number": "646 555-4567"
                           }
                       ]
                   })";
    _jsonModel.load(QByteArray::fromStdString(json));
}

QJsonModel *AppEngine::jsonModel() {
    return &_jsonModel;
}

QItemSelectionModel *AppEngine::selectionJsonModel() {
    return &_selectionModel;
}
